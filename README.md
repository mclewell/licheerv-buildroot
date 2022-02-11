# Buildroot for LicheeRV RISC-V Board
This board does not have mainline Linux or U-Boot support. It also appears 
unlikely that it ever will due to some non-standard hardware implementations
used by the Allwinner D1 processor. The repo contains a buildroot configuration
based off the work in [this Github repo](https://github.com/maquefel/licheerv-boot-build).

## Usage
Install the build host prerequisites (Ubuntu 20.04):
```
sudo apt install sed make binutils gcc g++ bash patch gzip bzip2 perl tar \
	cpio python unzip rsync wget libncurses-dev swig
```

Clone this repo and initialize submoudles:
```
git clone https://github.com/mclewell/licheerv-buildroot.git
git submodule update --init
```

Create output directory and build SD-Card image for the board:
```
cd buildroot
mkdir output-licheerv
cd output-licheerv
make -C ../ O=$(pwd) BR2_EXTERNAL=$PWD/../../ licheerv_defconfig
```

The resulting image will be located in the ```images``` directory. Write the image to 
an SD-Card:
```
dd if=images/sdcard.img of=/dev/sdX bs=1M status=progress && sync
```

Attach a UART to either the LicheeRV board proper or to the 40-pin header on the dock. The
default login is ```root``` with no password. 
