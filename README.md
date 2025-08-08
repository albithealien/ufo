# ufo
> Pragmatic and minimal Void Linux builds using modern tools!

I need a systam that:

* Gets me to my goals(passing exams, shipping and working super good to get infinite money)
* Is minimal so I can understand it(and kind of elitist)[^1]
* Uses sensible modern utilities by default
* Has low overhead once it clicks and builds little fatigue while using it[^2]
* Takes no time installing and is mostly unopinionated

Is that you? Great then read the rest.

> [!IMPORTANT]
> You can install whatever you need on top of a build or even fork to make your own!
>
> Want to get Neovim after installing the minimal build?
>
> Then just go ahead and `xbps-install neovim`.

## Builds
There are three builds available.

All of them built on the latest Void Linux rootfs with no modifications to `base-system` nor `base-devel`.

The minimal build adds:
* FAT and NTFS(meaning you can mount Windows disks) compatabilty and utilities.
* Microcode for your CPU and various free and proprietary(again, we are going for goals and pragamtism here, not ideology) drivers. [^3]
* Sensible selection of services installed and enabled(except for openssh and docker by default)!
* Modern utilities replacing older ones(but nothing stupid meaning fd instead of find and ripgrep instead of grep, but no eza instead of ls or bat instead of cat).
* The GNU C toolchain, the Go toolchain and Sqlite3 plus Rizin for binary/process hacking.
* A Grub configuration that automatically detects other systems on the disk for a painless multi boot.
* Accessible resources and documentation right here!

> [!TIP]
> Some of the modern utilities are aliased to the older ones(e.g. find is aliased to fd for standard users).

The xorg build adds:
* Graphical drivers for a Xorg minimal installation with a selection of utilities including xclip and xrandr
* The Noto fonts as a base including Chinese, Japanese and Korean fonts plus Emojis
* Audio with pulseaudio
* Bluetooth with bluez

The games build adds:
* Everything necessary to run Steam games with Proton if you have a good enough GPU

## Let's get into it
* [Components, a curated index of all the major builds packages](#components)
* [Documentation, for the builds and beyond](#documentation)
* [Alternatives and additions, alternatives to the provided packages or additions](#alternatives-and-additions)
### Components
* linux: kernel
* kmod: manages kernel modules
* dracut: generates initramfs
* grub: bootloader
* os-prober: detects other operating systems installed
* efibootmgr: manages UEFI boot entries
* runit: beautiful init system
* bash: bourne again shell
* xbps: package manager
* agetty: manages TTYs
* bluez: bluetooth support
* cronie: cron implementation
* dhcpcd: DHCP client
* ntpd and chrony: time sync
* tzdata: timezones data
* openssh: secure remote shell
* iptables: firewall
* man(man-pages and mdocml) and info(textinfo): manual pages and gnu system info
* coreutils: gnu core utilities
* diffutils: gnu diff utilities
* binutils: gnu binary utilities
* e2fsprogs, btrfs-progs, xfsprogs and ntfs-3g: ext4, btrfs, xfs and ntfs utilities
* f2fs-tools, dosfstools, exfat-utils: fat and exfat utilities
* aria2: download utility also supporting BitTorrent
* wget: download utility supporting HTTP(S) and (S)FTP, aria is better, but wget is often required by scripts
* atool(with the gzip, tar, xz, 7zip, unzip and unrar backends), comfy archving tool
* bc: basic calculator, no idea why it's in `base-devel`
* curl: powerful HTTP client
* ed: standard editor
* nvi: visual editor
* micro, an intuitive and simple editor anyone can use
* ctags: generates tags on a codebase, 90s style
* fastfetch: rewrite of neofetch, dumb
* ffmpeg: multimedia processing
* findutils: includes find and xargs
* fd: modern replacement for find
* grep: going to regular expressions
* ripgrep: modern replacement for grep
* sed: stream editor
* jq and yq: JSON and YAML processors
* less: pager
* typst: modern markup based typetting system
* magic-wormhole: gets things from one computer to another
* openssl: TLS/SSL and cryptography, you can use it for hashing
* procps-ng: process tools
* q: modern dig alternative
* sudo: privilege escalation
* traceroute: network rouce tracing
* troff and groff: documentatio tools
* util-linux: various system utilities
* xxd: formats in octal, hexadecimal and binary
* base-files: essental system files
* dash: system POSIX shell
* file: what's that file type?
* which: shows the full of executable
* gawk: gnu awk implementation
* gcc: gnu compiler collection
* gdb: gnu debugger
* make: build system
* bison: parser generator
* flex: lexer
* m4: macro processor
* git: version control system
* git-lfs: large file support for git
* github-cli: GitHub's official CLI
* go: toolchain for the Go programming language
* iproute2 and iputils: network utilities
* iw, wpa_supplicant and wifi-firmware: wifi support
* kbd: keyboard utilities
* pciutils: PCI utilities I also use to install the correct microcode and GPU drivers post installation
* rizin(rz-ghidr): binary exploitation, process hacking and reverse engeneering
* strace: traces syscalls
* ltrace: traces library calls
* shadow: users and groups management
* sqlite: embeddable SQL database
* upx: compresses binaries
* void-artwork and removed-packages: artwork and cleanup scripts
* nginx and caddy: reverse proxies
* certbot-nginx: certbot nginx plugin
* docker(including buildx, compose): containers
* k3d: containers orchestration
* terraform: infrastructure as code
* ncurses: famous TUI library
* patch: applies diffs to source files
* pkg-config: retrieve information about installed libraries
* acpid: handles ACPI events
* autoconf: generates `configure` scripts from portable software builds
* automake: creates template files for autoconf
* dbus: message bus system 
* elogind: manages user logins, seats and power access
* ethtool: network hardware management
* eudev: device manager
* gettext: multi language support utilities
* iana-etc: maps standard ports to protocols
* libgcc: gcc runtime library
* libtool: cross platoform library linking and compilation
* texinfo: gnu documentation system
* tlp: power management for laptops
* usbutils: usb utilities

### Documentation
Use `man` to access manual pages for most programs and `info` to access GNU texinfo pages
* [void linux](https://docs.voidlinux.org/) which is always  worth a read
* [linux kernel](https://docs.kernel.org/) which is worth a read if you are interested in everything lower level
* [gnu project](https://www.gnu.org/doc/doc.en.html) which is unlikely to be worth a read overall, but great for specific GNU userland utilities IMO

Check out [bookmarks.html from my dotfiles](https://github.com/albithealien/dotfiles)

### Alternatives and additions
Here's an opinionated beautiful list based on my experience.

Whenever you can't find something from the [official repositories](https://voidlinux.org/packages/), it's probable you can find it it [void-packages](https://github.com/void-linux/void-packages), if you can't find it there either, then grab a binary or compile it yoursef!

#### Kernel
* linux-lts: linux long term support which is going to be behind some versions
* linux-mainline: linux mainline which is going to be ahead some version
* linux-zen: a desktop optimzed build available from void-packages
#### Shell
* zsh: another POSIX shell with plugins
#### Editor
> [!NOTE]
> As much as I love them, ex, vi and ctags are not gonna be enough for most people, pretty sure micro won't cut it for you either.

Here are editors you can install(though I'd provide a list of beloved and mantained ones so you can check them out if you wish to do so) [^4]
* [vim](https://github.com/vim/vim)(vim-x11 has clipboard support): Vi iMproved, a highly customizable modal editor using it's own language called VimScript
* [vis](https://github.com/martanne/vis): a Vi inspired alternative using structural regular expressions like `sam`
* [neovim](https://neovim.io/): a community `vim` rewrite with Lua support and even more extensible
* [helix](https://github.com/helix-editor/helix): a new take on modal editing
* [emacs](https://www.gnu.org/software/emacs/)(and [doomemacs](https://github.com/doomemacs/doomemacs)): a usually(emacs-nox) graphical text editor and interpiter for Emacs Lisp
* [visual studio code](https://code.visualstudio.com/): the most popular graphical editor from Microsoft using Electron
* [zed](https://zed.dev/): the new visual studio code competitor providing better performances made in Rust

### Some packages tricks
* Use `xbps-install -Syu` to upgrade the system, install packages and automatically these confirm actions
* Use `xbps-query -Rs` to search for packages in the repositories
* Use `xbps-query -f package` to find out what files that package installs
* Use `xbps-query -l` to list installed packages
* Use `xbps-query -o /path/to/binary` to find out what package the binary is part of
* Use `xbps-remove -Rf` to remove a package and it's dependencies, use `-F` to do the same, but without limitations on shared libraries or system packages meaning you can remove something from `base-system`
* xbps(query -o, install -Syu, query -R, query -l, remove -Rf, query -f), tzdata, iana-etc, kbd

### Frequently asked questions
* Wait a second, what's added to the system with the xorg and games builds?
Literally just read `build.sh` it's super easy!
* How do I dive even deeper once I get comfy and master all the packages I need?
I'd go for mastering an ASM reference, more binary or process hacking and getting acquainted with linux syscall table.
> [!NOTE]
> Check out bookmarks.html from my [dotfiles](https://github.com/albithealien/dotfiles)!

## Internals
### Grub
The grub configuration will automatically detect other systems installed for a dual boot or more.
### Skel
Every new standard user including the one created with the installer...
### Included fonts
* [Commit Mono](https://commitmono.com/)
* [Mononoki](https://madmalik.github.io/mononoki/)
* [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
* [Monoid](https://larsenwork.com/monoid/)
* [Fira Code](https://github.com/tonsky/FiraCode/)
> [!TIP]
> These are commercial alternatives which look great, but I will never pay for(probably)
* [Monalisa](https://www.monolisa.dev/)
* [Berkley Mono](https://usgraphics.com/products/berkeley-mono/)

## Building
To generate the ISOs you can just `sh build.sh`!

Clone(or even fork) this repository and modify `build.sh` to add/remove packages or change whatever else you might want by adding flags or directories to install on the new system(maybe put a file in every new user's home greeting them).

### How does it work?
This is part of the minimal build creation(read `build.sh` and [void-mklive's README](https://github.com/void-linux/void-mklive) because it's not complex).
```
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
```

# Footnotes
[^1]: Yes, this is a Linux kernel plus GNU userspace and a lot more meaning it's still gonna be challenging to undertand fully compared to something like OpenBSD which has a way smaller codebase, but I feel like this is the lower I can get without compromises.

[^2]: This is the true enemy we got as developers!
  Here's a video from [The Primeagen](https://www.youtube.com/watch?v=ZH3iKbEiks0) I really liked which touches on the topic

[^3]: The moment you use a modern CPU on a non core/libre booted system, you are holding a non rooted phone with Google services on it(meaning you are a normal person btw), often open something like Discord and play games like Valorant with kernel level anti-cheats on the same or another computer. 
  I'd say the argument for the super privacy oriented hacker computer goes out of the window and gets kind of cringy. 
  You are still going to want privacy which this system definately provides, but crying about proprietary drivers(blobs) is just stupid. 
  This is real pragmatism, you can live and work with this knowing you have privacy, you are in control and can install anything you like including proprietary applications and games if you wish or need to do so. 
  In fact, I am dual booting Windows 11 which I am going to need to take my AWS Solutions Architect Associate exam.

[^4]: I use vim and visual studio code, yeah, call me a normie, but I feel comfy with them!

# Contributions
Please point out redundancy in the builds or mistakes in the README.

Now we will be proceeding to remove as many useless packages as possible meaning something like bc because any runtime REPL can act as a calculator and not something like grep because it's required by Void Linux and scripts to fuction as sad as it is.

# Conclusion
Enjoy this beautiful and minimal system while getting to your goals and understanding computers more and more over time.
