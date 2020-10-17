Yet Another Multiboot System
===========================

NOTE: I recommend to use the new project Ventoy [Ventoy](https://github.com/ventoy/Ventoy) . It has more functions and is better designed. Therefore the YAMS project is archived.

YAMS or Yet Another Multiboot System is a bootable image designed to be used as an All-in-One USB flash drive.
You can boot Windows, Linux ISOs, EFI files or Tools. 

## Features

 * Based on GRUB 2
 * 64-bit (x86 & ARM) / 32-bit (x86) UEFI (+ Secure Boot) support
 * BIOS / UEFI CSM support
 * Windows support
 * GNU/Linux support
 
## Installation

Download the [YAMS image file from the release page](https://github.com/Sporesirius/YAMS/releases) and write it to a USB flash drive that you can create e.g. with [Etcher](https://www.balena.io/etcher/) (for Windows, Linux and macOS).

The YAMS image contains two partitions, one is the $ESP (FAT32 512MB) partition and the other is the YAMS (NTFS 512MB) partition.
Use [gparted](https://gparted.org/) for Linux, [MiniTool Partition Wizard](https://www.minitool.com/partition-manager/) for Windows or similar tools to resize the YAMS (NTFS 512MB) partition to get full USB drive space.

## Based / Inspired on
Thanks to the following projects
 * [GRUB2](https://www.gnu.org/software/grub/) is a boot loader package from the GNU Project
 * [Super-UEFIinSecureBoot-Disk](https://github.com/ValdikSS/Super-UEFIinSecureBoot-Disk): Boot any OS or .efi file without disabling UEFI Secure Boot
 * [a1ive's GRUB 2](https://github.com/a1ive/grub), Fork of GRUB 2 to add various features
 * [multibootusb](https://github.com/aguslr/multibootusb), A collection of GRUB files and scripts
 * [Red Hat shim](https://github.com/rhboot/shim), [from Fedora](https://apps.fedoraproject.org/packages/shim-signed), signed with Microsoft key, for initial boot
 * [Linux Foundation efitools](https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git), Tools for manipulating UEFI secure boot platforms
 * [ImDisk](http://www.ltr-data.se/opencode.html/#ImDisk) is a virtual disk driver for Windows operating systems
 * [wimboot](http://ipxe.org/wimboot) is a boot loader for Windows Imaging Format (.wim) files
 
 ## Other YAMS repos
 * [YAMS's GRUB 2](https://github.com/Sporesirius/YAMS-GRUB2.git)
 * [YAMS's PreLoader](https://github.com/Sporesirius/PreLoader)
 * [YAMS's Tools](https://github.com/Sporesirius/YAMS-Tools)
