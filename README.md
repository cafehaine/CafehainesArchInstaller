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

# Current status

The `build_image.sh` script generates an arch image, which boots with grub. Then a prompt is shown, asking you to either run the wizard (only starts Xorg at the moment) or run bash/poweroff.

## Todo
- Installer
- Squashfs
- Network setup helper
- Partitionning helper

# How it works

The generated image will be a minimal arch install, with the installer script,
and a de to show a pretty wizard.

My goal is to have this image running on all my PCs without tweaking the kernel
arguments. This means only EFI, for x86\_64 CPUs, but support for 32b and 64b
EFI firmwares, but also support for laptops with iGPU and dGPU, and weird stuff
that my non-free laptops have.

The package list installed on the image is the following:

- base (nano, fdisk, cfdisk, …)
- base-devel (to compile some stuff)
- grub (32bit and 64bit EFI support)
- arch-install-scripts (duh)
- fluxbox (lightweight DE)
- xterm (basic terminal emulator)
- xorg-server / xorg-xinit (to display a Xorg session)
- luarocks (to install some dependencies for the wizard)
- fltk (toolkit used by the wizard)
- ttf-dejavu ('cause fluxbox needs a font)

(this list is subject to changes at any time)
