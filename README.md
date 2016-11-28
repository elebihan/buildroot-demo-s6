# buildroot-demo-s6 - s6 Supervision for Embedded Devices

## Overview

[s6](http://skarnet.org/software/s6/) is small and secure supervision suite.
Its companion, [s6-rc](http://skarnet.org/software/s6-rc/) is a complete
service manager.

[buildroot](http://buildroot.org/) is a tool to generate embedded Linux systems.

buildroot-s6 allows the user to build a firmware for an embedded Linux device
using s6 and s6-rc as its init system instead of SysV or systemd.
