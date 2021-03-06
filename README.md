What is this?
=============

This is a Python 2.7.3 build for Boot2Gecko. It is likely also compatible with Android but I have only tested with Boot2Gecko.

This opens up some interesting possibilities for (build) automation and security tools.

A precompiled version is included as the `python.tgz` archive.

Please file issues if things don't work as expected.

Building
========

Building this is easy with the provided scripts. First you need to build a host Python because we need some tools to bootstrap a cross-compile.

```
$ ./build-host.sh
```

Then build for the target:

```
$ ./build-target.sh
```

This will install in the `install` directory and also create a `python.tgz` archive.

Installing
==========

If your build was succesful then you can install Python using the `adb` tool, which is part of the Android SDK. You will need to have a recent version installed and on your `PATH`:

```
$ adb push install/data/python /data/python
$ adb push python /system/bin/python
$ adb shell chmod 766 /system/bin/python
```

Now you should be able to run python with

```
$ adb shell
# python
Python 2.7.3 (default, Dec 20 2012, 14:25:30) 
[GCC 4.4.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> os.uname()
('Linux', 'localhost', '3.0.8-perf', '#1 PREEMPT Tue Oct 16 07:34:52 PDT 2012', 'armv7l')
```

Enjoy.

