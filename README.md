This is a Python 2.7.3 build for Boot2Gecko. It is likely also compatible with Android but I have only tested with Boot2Gecko.

This opens up some interesting possibilities for (build) automation and security tools.

Building
========

Building this is easy with the provided scripts. First you need to build a host Python because we need some tools to bootstrap a cross-compile.

```
$ ./build-host.sh
```

Installing
==========

If you build was succesful then you can install Python using the `adb` tool, which is part of the Android SDK. You will need to have a recent version installed and on your `PATH`:

```
$ cd b2g-python
$ build-host.sh
$ build-target.sh
$ adb push install/data/python /data/python
```

Using
=====

Once you have copied Python to your device you have to set `LD_LIBRARY_PATH`, `PYTHONHOME` and `PATH` correctly:

```
root@android:/data # export LD_LIBRARY_PATH=/data/python/lib                   
root@android:/data # export PYTHONHOME=/data/python
root@android:/data # export PATH=$PATH:/data/python/bin
root@android:/data # python
Python 2.7.3 (default, Dec 20 2012, 14:25:30) 
[GCC 4.4.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> os.uname()
('Linux', 'localhost', '3.0.8-perf', '#1 PREEMPT Tue Oct 16 07:34:52 PDT 2012', 'armv7l')
```

Enjoy.

