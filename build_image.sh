#!/usr/bin/bash

if [ "$UID" -ne 0 ]; then
	echo "You should run this script as root."
	exit 1
fi

PACKAGES=("base" "grub" "arch-install-scripts" "gparted" "fluxbox" "xterm"
	"xorg-server" "xorg-xinit")
SERVICES=()

#Generate build directory
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
mount /dev/loop0p2 /mnt
mkdir /mnt/boot
mount /dev/loop0p1 /mnt/boot

#pacstrap packages
pacstrap -c -G -M /mnt ${PACKAGES[@]}

#Enable services
#TODO

#Copy scripts and configs
cp -R ../skeleton/* /mnt/

#Rebuild initramfs with new preset
rm /mnt/boot/*.img
arch-chroot /mnt /bin/bash -c "mkinitcpio -p linux"

#Configure grub
arch-chroot /mnt /bin/bash -c "grub-install --target=x86_64-efi --efi-directory=/boot --removable"
arch-chroot /mnt /bin/bash -c "grub-install --target=i386-efi --efi-directory=/boot --removable"

#Unmount partitions
sync
umount -R /mnt

#Unmount loop device
losetup -d /dev/loop0

#VBoxManage convertfromraw --format VDI image.img image.vdi
#VBoxManage internalcommands sethduuid image.vdi 09a9d176-321c-451d-b075-394cd0160da9
