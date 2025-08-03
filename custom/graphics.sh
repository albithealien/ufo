#!/bin/sh

# Installing Intel microcode if missing
if grep -q "GenuineIntel" /proc/cpuinfo; then
    xbps-install -y intel-ucode
fi

# Installing the right graphics drivers
GPU=$(lspci | grep -E "VGA|3D")
case "$GPU" in
    *AMD*)
        xbps-install -y xf86-video-amdgpu xf86-video-ati
        ;;
    *Intel*)
        xbps-install -y mesa-vulkan-intel intel-video-accel
        ;;
    *NVIDIA*)
        xbps-install -y nvidia nvidia-docker nvidia-vaapi-driver
        ;;
esac

# Regenerating the initramfs
if [ -f /boot/initramfs-* ]; then
    xbps-reconfigure -f linux$(uname -r | cut -d. -f1-2)
fi
