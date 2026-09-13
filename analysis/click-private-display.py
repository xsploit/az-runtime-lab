"""Send one XTest click to the explicitly supplied private lab Xvfb display."""
import ctypes,sys,time,json
x=ctypes.CDLL('libX11.so.6');t=ctypes.CDLL('libXtst.so.6')
x.XOpenDisplay.argtypes=[ctypes.c_char_p];x.XOpenDisplay.restype=ctypes.c_void_p
x.XSync.argtypes=[ctypes.c_void_p,ctypes.c_int]
x.XFlush.argtypes=[ctypes.c_void_p];x.XCloseDisplay.argtypes=[ctypes.c_void_p]
t.XTestFakeMotionEvent.argtypes=[ctypes.c_void_p,ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_ulong]
t.XTestFakeButtonEvent.argtypes=[ctypes.c_void_p,ctypes.c_uint,ctypes.c_int,ctypes.c_ulong]
d=x.XOpenDisplay(sys.argv[1].encode())
if not d:raise RuntimeError('Private X display unavailable')
try:
 motion=t.XTestFakeMotionEvent(d,-1,int(sys.argv[2]),int(sys.argv[3]),0);x.XFlush(d)
 down=t.XTestFakeButtonEvent(d,1,1,0);x.XFlush(d);time.sleep(.08)
 up=t.XTestFakeButtonEvent(d,1,0,0);x.XSync(d,0)
 print(json.dumps(dict(display=sys.argv[1],motion=motion,button_down=down,button_up=up)))
finally:x.XCloseDisplay(d)
