#!/bin/bash

BOARD_DIR="$(dirname $0)"
UBOOT_DIR="${BUILD_DIR}/uboot-$2"

cd ${BINARIES_DIR}

# Copy the U-Boot Device Tree into the binaries dir. Linux 5.16 added
# a DTB schema cheker that causes Linux to fail to build due to a missing
# libyaml error.
cp ${UBOOT_DIR}/arch/riscv/dts/sun20i-d1-nezha-lichee.dtb ./

# Generate the TOC1 which is like the SPL for Allwinner
${UBOOT_DIR}/tools/mkimage -T sunxi_toc1 -d ${BOARD_DIR}/toc1.cfg u-boot.toc1

cd ~-
echo "Creating SD-Card image..."
support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
