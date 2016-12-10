# buildroot-demo-s6 - Showcase s6 Supervision for Embedded Devices

## Overview

[s6](http://skarnet.org/software/s6/) is small and secure supervision suite.
Its companion, [s6-rc](http://skarnet.org/software/s6-rc/) is a complete
service manager.

[buildroot](http://buildroot.org/) is a tool to generate embedded Linux systems.

buildroot-demo-s6 allows the user to build a firmware for an embedded Linux
device using s6 and s6-rc as its init system instead of SysV or systemd.

Several predefined configurations to showcase s6 are provided:

- QEMU/x86
- Raspberry Pi
- HardKernel ODROID-C2

## How to Build a Firmware

### QEMU

In this configuration, all the programs are built using the
[GNU libc](https://www.gnu.org/software/libc/) and dynamically linked. To build
a firmware, execute:

```sh
$ make O=$PWD/output-x86 demo_s6_qemu_x86_defconfig
$ make O=$PWD/output-x86
```

Once the build is finished, the images for QEMU are available in
``./output-x86/images``. Run it like this:

```sh
$ qemu-system-i386 -M pc -kernel output-x86/images/bzImage \
    -drive file=output-x86/images/rootfs.ext2,if=virtio,format=raw \
    -append "root=/dev/vda" \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80
```

It is possible to connect via SSH to the target using:

```sh
$ ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost
```

The web server running on the target can be accessed by opening a web browser
at http://localhost:8080.

### Raspberry Pi

In this configuration, all the programs are built using
[musl libc](http://www.musl-libc.org/) and statically linked. To build a
firmware, execute:

```sh
$ make O=$PWD/output-rpi demo_s6_rpi_defconfig
$ make O=$PWD/output-rpi
```

Once the build is finished, the images for the SD card are available in
``./output-rpi/images``.

### ODROID-C2

In this configuration, all the programs are built using the GNU libc and
dynamically linked. To build a firmware, execute:

```sh
$ make O=$PWD/output-odroidc2 demo_s6_odroidc2_defconfig
$ make O=$PWD/output-odroidc2
```

Once the build is finished, the images for the SD card are available in
``./output-odroidc2/images``.
