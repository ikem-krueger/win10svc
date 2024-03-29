#! /usr/bin/env python
#
# GUI module generated by PAGE version 4.9
# In conjunction with Tcl version 8.6
#    Sep 14, 2017 06:07:28 PM
import sys

try:
    from Tkinter import *
except ImportError:
    from tkinter import *

try:
    import ttk
    py3 = 0
except ImportError:
    import tkinter.ttk as ttk
    py3 = 1

import webbrowser

def callback(event):
    webbrowser.open_new(r"https://github.com/ikem-krueger/win10srv")

def vp_start_gui():
    '''Starting point when module is the main routine.'''
    global val, w, root
    root = Tk()
    top = New_Toplevel_1 (root)
    root.mainloop()

w = None
def create_New_Toplevel_1(root, *args, **kwargs):
    '''Starting point when module is imported by another program.'''
    global w, w_win, rt
    rt = root
    w = Toplevel (root)
    top = About_-_Windows_10_Service_Tool (w)
    return (w, top)

def destroy_New_Toplevel_1():
    global w
    w.destroy()
    w = None

class New_Toplevel_1:
    def __init__(self, top=None):
        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('vista')

        top.geometry("295x193+505+325")
        top.title("About - Windows 10 Service Tool")
        top.resizable(width=False, height=False)
        top.bind('<Escape>', lambda e:top.destroy())

        self.TLabel1 = ttk.Label(top)
        self.TLabel1.place(relx=0.30, rely=0.1, height=26, width=120)
        self.TLabel1.configure(font="-size 14 -weight bold")
        self.TLabel1.configure(text='''win10svc 1.0''')

        self.TLabel2 = ttk.Label(top)
        self.TLabel2.place(relx=0.10, rely=0.26, height=19, width=240)
        self.TLabel2.configure(text='''A small tool to reset the Windows 10 services''')

        self.TLabel5 = ttk.Label(top)
        self.TLabel5.place(relx=0.26, rely=0.36, height=19, width=190)
        self.TLabel5.configure(text='''back to their default states.''')

        self.TLabel3 = ttk.Label(top)
        self.TLabel3.place(relx=0.2, rely=0.56, height=19, width=176)
        self.TLabel3.configure(text='''Copyright (C) 2017 Ikem Krueger''')

        self.TLabel4 = ttk.Label(top)
        self.TLabel4.place(relx=0.1, rely=0.68, height=19, width=229)
        self.TLabel4.configure(foreground="blue")
        self.TLabel4.configure(font="-size 9 -underline 1")
        self.TLabel4.configure(text='''https://github.com/ikem-krueger/win10svc''')
        self.TLabel4.configure(cursor="hand2")
        self.TLabel4.bind('<Button-1>',callback)

        self.TButton1 = ttk.Button(top)
        self.TButton1.place(relx=0.71, rely=0.83, height=25, width=76)
        self.TButton1.configure(takefocus="")
        self.TButton1.configure(text='''Close''')
        self.TButton1.configure(underline="0")
        self.TButton1.bind('<Button-1>',lambda e:top.destroy())
        self.TButton1.bind('<Return>',lambda e:top.destroy())
        self.TButton1.bind('<space>',lambda e:top.destroy())
        self.TButton1.focus()
        top.bind('<Alt-c>',lambda e:top.destroy())

if __name__ == '__main__':
    vp_start_gui()
