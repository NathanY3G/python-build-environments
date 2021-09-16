# Build environment for MicroPython


## Introduction
A build enivonment for [MicroPython](https://micropython.org) that runs within a [Docker](https://www.docker.com) container.


## Quick Start
A script named `activate.sh` has been written with the intent of providing a
convient starting point. It is limited in nature and expects the source code for
[MicroPython](https://micropython.org) to be present within the same directory
or a sub-directory. If you are already familiar with [Docker](https://www.docker.com)
you may wish to forego using this script.


### Example
The commands below demonstrate how to build [MicroPython](https://micropython.org)
for a Raspberry Pi Pico.

```bash
./activate.sh

cd micropython
make -C mpy-cross

cd ports/rp2
make submodules
make BOARD=PICO
```
