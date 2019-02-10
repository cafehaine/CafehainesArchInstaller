#!/usr/bin/bash

if [ "$UID" -ne 0 ]; then
	echo "You should run this script as root."
	exit 1
fi

PACKAGES=("base" "base-devel" "grub" "arch-install-scripts" "fluxbox" "xterm"
	"xorg-server" "xorg-xinit" "luarocks" "fltk" "ttf-dejavu")

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

#Mount partitions to /mnt
# Don't mount /dev/loop0p2 directly, mount a tmpfs that will be squashed
mount -t tmpfs tmpfs_cai /mnt
mkdir /mnt/boot
mount /dev/loop0p1 /mnt/boot

#pacstrap packages
pacstrap -c -G -M /mnt ${PACKAGES[@]}

#install luarocks deps
arch-chroot /mnt /bin/bash -c "luarocks install fltk4lua"

#Enable services
#TODO none at the moment

#Copy scripts and configs
cp -R ../skeleton/* /mnt/
cp -R ../scripts/* /mnt/usr/

#Uncomment mirrors in mirrorlist
mv /mnt/etc/pacman.d/mirrorlist{,.old}
sed "s/^#//" /mnt/etc/pacman.d/mirrorlist.old > /mnt/etc/pacman.d/mirrorlist
rm /mnt/etc/pacman.d/mirrorlist.old

#Rebuild initramfs with new preset
#TODO find a way to skip mkinitcpio hook
rm /mnt/boot/*.img
arch-chroot /mnt /bin/bash -c "mkinitcpio -p linux"

#Configure grub
MODULES="normal linux configfile test all_video efi_gop efi_uga video_bochs video_cirrus part_gpt gzio fat"
arch-chroot /mnt /bin/bash -c "grub-install --target=x86_64-efi --install-modules='$MODULES' --efi-directory=/boot --removable"
arch-chroot /mnt /bin/bash -c "grub-install --target=i386-efi --install-modules='$MODULES' --efi-directory=/boot --removable"

#Unmount partitions
sync
umount /mnt/boot
mksquashfs /mnt /dev/loop0p2 -noappend
umount /mnt

#Unmount loop device
losetup -d /dev/loop0

#Add partlabel to root partition
sgdisk -c 2:root_cai image.img

VBoxManage convertfromraw --format VDI image.img image.vdi
VBoxManage internalcommands sethduuid image.vdi 09a9d176-321c-451d-b075-394cd0160da9
