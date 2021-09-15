# Build environment for CircuitPython


## Introduction
A build enivonment for [CircuitPython](https://circuitpython.org) that runs within a [Docker](https://www.docker.com) container.


## Quick Start
A script named `activate.sh` has been written with the intent of providing a
convient starting point. It is limited in nature and expects the source code for
[CircuitPython](https://circuitpython.org) to be present within the same directory
or a sub-directory. If you are already familiar with [Docker](https://www.docker.com)
you may wish to forego using this script.


### Example
The commands below demonstrate how to build [CircuitPython](https://circuitpython.org)
for a Raspberry Pi Pico.

```bash
./activate.sh

cd circuitpython
make -C mpy-cross

cd ports/raspberrypi
make BOARD=raspberry_pi_pico 
```

## Further Reading
I recommend reading [Adafruit's comphrehensive guide](https://learn.adafruit.com/building-circuitpython/build-circuitpython)
to learn more about the build process and how you can contribute.
