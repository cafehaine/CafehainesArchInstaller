# CaféHaine's Arch Installer

CaféHaine's Arch Installer is an installer for arch mainly built for my own use,
but feel free to patch it and use it however you want (as long as you respect
the licence).

My goal is to have suggestions based on the packages that I use, but allow to
modify the package list before installing, so you have the freedom to choose
whatever you want.

# Disclaimer

I am not responsible to any damages caused to your computer by this image and or
installer. Please read the licence.

# How it works

The generated image will be a minimal arch install, with the installer script,
and a de to run gparted.

My goal is to have this image running on all my PCs without tweaking the kernel
arguments. This means only EFI, for x86\_64 CPUs, but support for 32b and 64b
EFI firmwares, but also support for laptops with iGPU and dGPU, and weird stuff
that my non-free laptops have.

The package list installed on the image is the following:

- base (nano, fdisk, cfdisk, …)
- grub (32bit and 64bit EFI support)
- arch-install-scripts (duh)
- gparted (fully feature graphical partition editor)
  - all the packages required to support all partition formats
- fluxbox (lightweight DE)
- xterm (basic terminal emulator)
- netsurf (lightweight web browser)

(this list is subject to changes at any time)
