#!/bin/sh
# One arm of the bare-Xorg experiment. `start`: stop the sway kiosk session,
# bring up Xorg :1 on the DSI panel from xorg-bare.conf, verify it, and start
# an AZ --no-controller session attached to it (config copy with
# external_display ":1"). `stop`: end that session and Xorg, restart the
# PiFLX session unit (its kiosk is gone, so a restart is clean).
# Everything it changes is undone by `stop`; arm rollback-watchdog.sh too.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; CONF=${XORG_CONF:-/tmp/xorg-bare.conf}; D=:1
CFG=$LAB/local/session-library-xorg.json
case ${1:?start|stop|session} in
start)
  sudo -n systemctl stop pflx-session
  # A kiosk shell orphaned from the unit (an earlier restart) survives the stop
  # and keeps relaunching sessions with no compositor: end it by exact args.
  for p in $(ps -eo pid,args | awk '/start-pflx-kiosk|pflx-az-session|pflx-bitedj-supervisor/ && !/awk/{print $1}'); do kill "$p" 2>/dev/null; done
  for p in $(ps -eo pid,args | awk '/python3 pi\/session.py/ && !/awk/{print $1}'); do kill -TERM "$p" 2>/dev/null; done
  # The old supervisor holds local/session.lock until its cleanup finishes;
  # starting the next session before that fails with EAGAIN on the lock.
  i=0; while [ $i -lt 40 ]; do [ "$(ps -eo args | awk '/python3 pi\/session.py/ && !/awk/' | wc -l)" = 0 ] && ! pgrep -x EP147 >/dev/null && break; sleep 1; i=$((i+1)); done; echo "previous session gone after ${i}s"
  i=0; while [ $i -lt 30 ]; do pgrep -x sway >/dev/null || break; sleep 1; i=$((i+1)); done; echo "sway gone after ${i}s"
  sudo -n rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
  sudo -n nohup setsid /usr/lib/xorg/Xorg $D -config "$CONF" -ac -nolisten tcp -noreset -novtswitch -keeptty vt7 -logfile /tmp/xorg-bare.log >/tmp/xorg-bare.out 2>&1 </dev/null &
  i=0; while [ $i -lt 20 ]; do [ -S /tmp/.X11-unix/X1 ] && break; sleep 1; i=$((i+1)); done
  [ -S /tmp/.X11-unix/X1 ] || { echo "Xorg did not come up"; tail -20 /tmp/xorg-bare.log; exit 1; }
  sudo -n chmod a+rw /tmp/.X11-unix/X1 2>/dev/null
  echo "Xorg up after ${i}s: $(grep -E "modeset|glamor|AccelMethod|ShadowFB|Output DSI|Using|no screens|\(EE\)" /tmp/xorg-bare.log | tail -8 | cut -c1-120 | tr '\n' '|')"
  python3 - "$LAB/local/session-library.json" "$CFG" <<'PY'
import json,sys;c=json.load(open(sys.argv[1]));c['external_display']=':1';json.dump(c,open(sys.argv[2],'w'),indent=2)
PY
  sh "$0" session;;
session)
  cd "$LAB"; export XDG_RUNTIME_DIR=/run/user/$(id -u)
  python3 pi/session.py "$CFG" --check || exit 1
  nohup setsid python3 pi/session.py "$CFG" --no-controller > "$LAB/local/xorg-session.log" 2>&1 </dev/null &
  echo "session started; log $LAB/local/xorg-session.log";;
stop)
  sup=$(ps -eo pid,args | awk '/python3 pi\/session.py/ && /session-library-xorg.json/ && !/awk/{print $1; exit}'); [ -n "$sup" ] && kill -TERM "$sup"
  i=0; while [ $i -lt 30 ]; do pgrep -x EP147 >/dev/null || break; sleep 1; i=$((i+1)); done
  for p in $(pgrep -x Xorg); do sudo -n kill -TERM "$p"; done; sleep 3
  # Xorg leaves VT7 active; sway's logind session is on tty1 and times out
  # ("Timeout waiting session to become active") until the VT is switched back.
  sudo -n chvt 1
  sudo -n systemctl start pflx-session; echo "pflx-session restarted";;
esac
