(() => {
  'use strict';
  const clips = JSON.parse(document.getElementById('clips').textContent);
  const $ = id => document.getElementById(id);
  const videos = [$('video-a'), $('video-b')];
  const selects = [$('select-a'), $('select-b')];
  const status = $('status');
  let playing = false, busy = false, epoch = 0, duration = 6, scrubWasPlaying = false;
  const report = (message, error = false) => {
    status.textContent = message;
    status.classList.toggle('error', error);
  };
  const pause = () => {
    playing = false;
    videos.forEach(v => v.pause());
    $('play').textContent = 'Play both';
  };
  const setControls = enabled => {
    ['play', 'restart', 'back', 'forward', 'scrub'].forEach(id => $(id).disabled = !enabled);
  };
  const refreshTime = () => {
    $('clock').textContent = `${videos[0].currentTime.toFixed(2)} s`;
    $('scrub').value = videos[0].currentTime;
    const skew = Math.abs(videos[0].currentTime - videos[1].currentTime) * 1000;
    $('skew').textContent = `Clock difference: ${skew.toFixed(0)} ms`;
  };
  const waitFor = (video, event, ready) => new Promise((resolve, reject) => {
    if (ready()) { resolve(); return; }
    const timer = setTimeout(() => finish(new Error('Video took too long to load or seek.')), 15000);
    function finish(error) {
      clearTimeout(timer);
      video.removeEventListener(event, done);
      video.removeEventListener('error', failed);
      error ? reject(error) : resolve();
    }
    function done() { finish(); }
    function failed() { finish(new Error('This browser could not decode a video. Try Chrome or Edge.')); }
    video.addEventListener(event, done, { once: true });
    video.addEventListener('error', failed, { once: true });
  });
  const seek = async time => {
    const target = Math.max(0, Math.min(time, duration - 0.001));
    await Promise.all(videos.map(async v => {
      if (Math.abs(v.currentTime - target) < 0.0005 && !v.seeking) return;
      v.currentTime = target;
      await waitFor(v, 'seeked', () => !v.seeking);
    }));
    refreshTime();
  };
  const start = async () => {
    if (busy) return;
    busy = true;
    try {
      await seek(videos[0].currentTime >= duration - 0.03 ? 0 : videos[0].currentTime);
      videos.forEach(v => v.playbackRate = Number($('speed').value));
      await Promise.all(videos.map(v => v.play()));
      playing = true;
      $('play').textContent = 'Pause both';
      report('Playing both clips');
    } catch (error) { pause(); report(error.message, true); }
    finally { busy = false; }
  };
  const move = async (time, resume = false) => {
    if (busy) return;
    pause(); busy = true;
    try { await seek(time); report('Paused'); }
    catch (error) { report(error.message, true); }
    finally { busy = false; }
    if (resume) await start();
  };
  const loadPair = async () => {
    const generation = ++epoch;
    pause(); setControls(false); busy = true;
    report('Loading videos…');
    try {
      await Promise.all(videos.map(async (v, i) => {
        const clip = clips.find(c => c.id === selects[i].value);
        $(`caption-${i ? 'b' : 'a'}`).textContent = clip.caption;
        v.src = clip.src;
        v.load();
        await waitFor(v, 'loadeddata', () => v.readyState >= 2);
      }));
      if (generation !== epoch) return;
      duration = Math.min(...videos.map(v => v.duration));
      if (!Number.isFinite(duration) || duration <= 0) throw new Error('The video duration is unavailable.');
      $('scrub').max = duration;
      $('duration').textContent = `${duration.toFixed(2)} s`;
      await seek(0);
      setControls(true); report('Ready — play both or step through frames');
    } catch (error) { if (generation === epoch) report(error.message, true); }
    finally { if (generation === epoch) busy = false; }
  };
  selects.forEach((select, i) => {
    clips.forEach(c => select.add(new Option(c.label, c.id)));
    select.value = i ? 'fractional' : 'original';
    select.addEventListener('change', loadPair);
  });
  $('play').addEventListener('click', () => {
    if (playing) { pause(); report('Paused'); } else start();
  });
  $('restart').addEventListener('click', () => move(0, playing));
  $('back').addEventListener('click', () => move(videos[0].currentTime - 1 / 60));
  $('forward').addEventListener('click', () => move(videos[0].currentTime + 1 / 60));
  $('speed').addEventListener('change', () => videos.forEach(v => v.playbackRate = Number($('speed').value)));
  $('scrub').addEventListener('pointerdown', () => { scrubWasPlaying = playing; pause(); });
  $('scrub').addEventListener('input', () => { pause(); videos.forEach(v => v.currentTime = Number($('scrub').value)); refreshTime(); });
  $('scrub').addEventListener('change', async () => {
    const resume = scrubWasPlaying; scrubWasPlaying = false;
    await move(Number($('scrub').value), resume);
  });
  $('fullscreen').addEventListener('click', async () => {
    try {
      if (document.fullscreenElement) await document.exitFullscreen();
      else if ($('comparison').requestFullscreen) await $('comparison').requestFullscreen();
      else report('Use your browser’s full-screen control.');
    } catch { report('Use your browser’s full-screen control.'); }
  });
  document.addEventListener('fullscreenchange', () => $('fullscreen').textContent = document.fullscreenElement ? 'Exit full screen' : 'Full screen');
  async function atEnd() {
    if (!playing || busy) return;
    pause();
    if ($('loop').checked) await move(0, true);
    else report('End of comparison');
  }
  videos.forEach(v => v.addEventListener('ended', atEnd));
  function tick() {
    if (playing) {
      refreshTime();
      if (videos.some(v => v.currentTime >= duration - 0.012)) atEnd();
    }
    requestAnimationFrame(tick);
  }
  requestAnimationFrame(tick);
  loadPair();
})();
