#!/bin/sh
clean() { printf "%s" "$1" | tr '\n' ' ' | sed 's/  */ /g'; }

# Drivers
drivers="
efibootmgr
exfat-utils
linux-firmware
linux-headers
ntfs-3g
os-prober
pciutils
"
drivers=$(clean "$drivers")

# Services
services="
dbus
elogind
tlp
tlp-rdw
"
services=$(clean "$services")

# Utilities
utilities="
aria2
atool
ctags
curl
fastfetch
fd
ffmpeg
git
git-lfs
github-cli
jq
magic-wormhole
micro
openssl
7zip
7zip-unrar
q
ripgrep
stow
wget
xxd
yq
"
utilities=$(clean "$utilities")

# Cloud
cloud="
docker
docker-buildx
docker-compose
kubernetes
terraform
"
cloud=$(clean "$cloud")

# Dev
dev="
binutils
base-devel
strace
ltrace
upx
gdb
go
rizin
rz-ghidra
sqlite
"
dev=$(clean "$dev")

# Xorg
xorg="
libva-utils
mesa-dri
mesa-vaapi
mesa-vulkan-radeon
setxkbmap
vulkan-loader
xclip
xdg-user-dirs
xf86-video-dummy
xf86-video-fbdev
xinput
xone
xorg-input-drivers
xorg-minimal
xpadneo
xrandr
xset
"
xorg=$(clean "$xorg")

# Fonts
fonts="
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-ttf
noto-fonts-ttf-extra
noto-fonts-ttf-variable
"
fonts=$(clean "$fonts")

# Audio
audio="
alsa-firmware
sof-firmware
pulseaudio
"
audio=$(clean "$audio")

# Bluetooth
bluetooth="
broadcom-bt-firmware
bluez
"
bluetooth=$(clean "$bluetooth")

# Games
games="
void-repo-multilib
void-repo-multilib-nonfree
libdrm-32bit
libgcc-32bit
libglvnd-32bit
libstdc++-32bit
mesa-32bit
mesa-dri-32bit
mono
gstreamer1
gstreamer-vaapi
steam
steam-udev-rules
"

# Minimal
sudo ./mkiso.sh -a x86_64 -b base \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
	-- -k "us" -T "Void Linux" -o minimal.iso \
    -p "void-repo-nonfree" \
    -p "$drivers $services $utilities $cloud $dev" \
    -e /bin/bash \
	-I ./custom \
    -S "dhcpcd crond tlp dbus elogind" \
    -C "vconsole.keymap=us" 

# Xorg
sudo ./mkiso.sh -a x86_64 -b base \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
	-- -k "us" -T "VoidLinux" -o xorg.iso \
    -p "void-repo-nonfree" \
    -p "$drivers $services $utilities $cloud $dev" \
    -p "$xorg $fonts $audio $bluetooth" \
    -e /bin/bash \
	-I ./custom \
    -I ./custom/graphics.sh \
    -S "dhcpcd crond tlp dbus elogind" \
    -C "vconsole.keymap=us" 

# Games
sudo ./mkiso.sh -a x86_64 -b base \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
    -r "https://repo-fastly.voidlinux.org/current/multilib" \
    -r "https://repo-fastly.voidlinux.org/current/multilib/nonfree" \
	-- -k "us" -T "VoidLinux" -o games.iso \
    -p "void-repo-nonfree" \
    -p "$drivers $services $utilities $cloud $dev" \
    -p "$xorg $fonts $audio $bluetooth" \
    -p "$games" \
    -e /bin/bash \
	-I ./custom \
    -I ./custom/graphics.sh \
    -S "dhcpcd crond tlp dbus elogind" \
    -C "vconsole.keymap=us" 
