# Buildroot for LicheeRV RISC-V Board
This board does not have mainline Linux or U-Boot support. It also appears 
unlikely that it ever will due to some non-standard hardware implementations
used by the Allwinner D1 processor. The repo contains a buildroot configuration
based off the work in [this Github repo](https://github.com/maquefel/licheerv-boot-build).

## Usage
Clone this repo and initialize submoudles:
```
git clone https://github.com/mclewell/licheerv-buildroot.git
git submodule update --init
```
Create output directory and build SD-Card image for the board:
```
cd buildroot
mkdir output-licheerv
make -C ../ O=$(pwd) BR2_EXTERNAL=$PWD/../../ licheerv_defconfig
```

The resulting image will be located in the ```images``` directory. Write the image to 
an SD-Card:
```
dd if=images/sdcard.img of=/dev/sdX bs=1M status=progress && sync
```
