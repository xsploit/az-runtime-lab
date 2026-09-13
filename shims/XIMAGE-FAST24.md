# Experimental packed-24-bit X11 upload path

AZ was observed calling XPutImage with a 1280×800, depth-24, packed-24-bit
XImage (3840-byte rows). The Pi Xwayland server advertises 32-bit storage for
depth 24. The original image getter's generic byte loop was a major sampled
CPU hotspot. This shim expands the requested rectangle to 32-bit storage
before calling the original XPutImage, retaining the original depth and masks.
It does not change the renderer, panel refresh, firmware bytes or timing source.

Enable explicitly with `XIMAGE_FAST24=1` in the lab launcher. Disable by omitting
that variable and restarting. Requires the existing offline lab preload path.
Do not preload globally or replace system libraries.

Build on the Pi in `shims/`:

```sh
cc -O3 -Wall -Wextra -Werror -fPIC -shared -nostdlib ximage-fast24.c -o ximage-fast24.so
```

`-nostdlib` intentionally leaves libc/dlsym/XInitImage imports unversioned for
the older firmware runtime to resolve; inspect `readelf --version-info` before
use. No newly built glibc-version dependency should be introduced. The shim
uses independent per-call allocations and frees after synchronous XPutImage
consumption, so there is no retained buffer or lazy initialization race.
Allocation failures and unsupported formats/rectangles use the original call.

Verification:

```sh
cc -O2 -Wall -Wextra -Werror test-ximage-packed24.c -lX11 -o /tmp/test-ximage-packed24
/tmp/test-ximage-packed24
cc -g -fsanitize=address,undefined test-ximage-packed24.c -lX11 -o /tmp/test-ximage-packed24-san
/tmp/test-ximage-packed24-san
cc -O2 -Wall -Wextra -Werror test-ximage-upload.c -lX11 -ldl -o /tmp/test-ximage-upload
DISPLAY=:0 LD_PRELOAD="$PWD/ximage-fast24.so" /tmp/test-ximage-upload
```

The conversion test compares original and expanded XGetPixel values over 3000
random rectangles (898180 pixels), varied valid padding, offsets and source
immutability; rejection cases cover invalid rectangles/unsupported formats.
Host sanitizer and native Pi runs pass. The server test directly obtains the
original XPutImage through libX11's handle, compares it with the interposed
call in separate offscreen pixmaps, and reads back 320000 identical pixels
across 100 uploads including GC clipping. These are system-Xlib tests; actual
firmware loading and waveform performance require separate runtime checks.

Limitations: only little-endian, depth24/ZPixmap/packed24 with zero xoffset is
accelerated. This deliberately preserves other paths. X11 server readback
proves pixel equivalence, not panel presentation timing. Frame comparisons
should use identical tracks/view/capture settings and report capture overhead.
