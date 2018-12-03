#!/usr/bin/bash

rm -rf build
mkdir build

cp {.,./build}/image_layout.dump

cd build

#Disk image creation
dd if=/dev/zero of=./image.img bs=1M count=2048
sfdisk ./image.img < ./image_layout.dump

#Mount image as loop device
sudo losetup -P /dev/loop0 ./image.img

#Partition creation
mkfs.fat -F32 /dev/loop0p1
mlabel /dev/loop0p1:"Boot_CAI"
mkfs.ext4 -L "Root_CAI" /dev/loop0p2

#Mount partitions to /mnt
#pacstrap packages
#Enable services
#Copy scripts and configs
#Configure grub
#Unmount partitions

#Unmount loop device
sync
losetup -d /dev/loop0
