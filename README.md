Yet Another Multiboot System
===========================

YAMS or Yet Another Multiboot System is a bootable image designed to be used as a All-in-One USB flash drive.

## Features:

 * Based on GRUB 2
 * 64-bit (x86 & ARM) / 32-bit (x86) UEFI (+ Secure Boot) support
 * BIOS / UEFI CSM support
 * Windows support
 * GNU/Linux support
 
## Installation

Download [YAMS image file from releases page](https://github.com/Sporesirius/YAMS/releases) and write it to a USB flash drive that you can create e.g. with [Etcher](https://www.balena.io/etcher/) (for Windows, Linux and macOS).

The YAMS image contains two partitions, one is the $ESP (FAT32 512MB) partition and the other is the YAMS (NTFS 512MB) partition.
Use [gparted](https://gparted.org/) for Linux, [MiniTool Partition Wizard](https://www.minitool.com/partition-manager/) for Windows or similar tools to resize the YAMS (NTFS 512MB) partition to get full USB drive space.

## Based on:
Thanks to the following projects
 * [Super-UEFIinSecureBoot-Disk](https://github.com/ValdikSS/Super-UEFIinSecureBoot-Disk), Super UEFIinSecureBoot Disk: Boot any OS or .efi file without disabling UEFI Secure Boot
 * [a1ive's GRUB 2](https://github.com/a1ive/grub), Fork of GRUB 2 to add various features
 * [multibootusb](https://github.com/aguslr/multibootusb), A collection of GRUB files and scripts that will allow you to create a pendrive capable of booting different ISO files
 * [Red Hat shim](https://github.com/rhboot/shim), [from Fedora](https://apps.fedoraproject.org/packages/shim-signed), signed with Microsoft key, for initial boot
 * Modified [Linux Foundation PreLoader](https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git) to install circumventing UEFI Security Policy
 * GRUB2 with security bypass patches to chainloader, linux/linuxefi and shim
 
 ## Other YAMS repos
 * [YAMS's GRUB 2](https://github.com/Sporesirius/grub2)
 * [YAMS's PreLoader](https://github.com/Sporesirius/PreLoader)
 * [YAMS's Tools](https://github.com/Sporesirius/yams-tools)
