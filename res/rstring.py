import ctypes
from ctypes import wintypes

user32 = ctypes.WinDLL('user32', use_last_error=True)

def errcheck_bool(result, func, args):
    if not result:
        raise ctypes.WinError(ctypes.get_last_error())
    return args

user32.LoadStringW.errcheck = errcheck_bool
user32.LoadStringW.argtypes = (wintypes.HINSTANCE,
                               wintypes.UINT,
                               wintypes.LPWSTR,
                               ctypes.c_int)

PWCHAR = ctypes.POINTER(wintypes.WCHAR)

def load_string(hInstance, uID):
    resource = PWCHAR()
    lpBuffer = ctypes.cast(ctypes.byref(resource), wintypes.LPWSTR)
    nchar = user32.LoadStringW(hInstance, uID, lpBuffer, 0)
    return resource[:nchar]

if __name__ == '__main__':
    import os
    import sys
    if len(sys.argv) != 3:
        sys.exit('usage:\n%s dllPath stringId' % os.path.basename(sys.argv[0]))
    hInstance = ctypes.WinDLL(sys.argv[1])._handle
    uID = int(sys.argv[2])
    print(load_string(hInstance, uID))
