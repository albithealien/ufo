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
"
drivers=$(clean "$drivers")

# Services
services="
cronie
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
unrar
q
ripgrep
wget
xxd
yq
"
utilities=$(clean "$utilities")

# Cloud
cloud="
nginx
certbot-nginx
caddy
docker
docker-buildx
docker-compose
k3d
terraform
"
cloud=$(clean "$cloud")

# Dev
dev="
base-devel
strace
ltrace
gdb
go
rizin
rz-ghidra
sqlite
typst
upx
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
xorg-input-drivers
xorg-minimal
xprop
xrandr
xset
"
xorg=$(clean "$xorg")

# Fonts
fonts="
noto-fonts-ttf
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
xone
xpadneo
gstreamer1
gstreamer-vaapi
SDL2
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
    -I ./custom/fonts.sh \
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
    -I ./custom/fonts.sh \
    -I ./custom/games.sh \
    -S "dhcpcd crond tlp dbus elogind" \
    -C "vconsole.keymap=us" 
