#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/capybaraos.kernel isodir/boot/capybaraos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "capybaraos" {
	multiboot /boot/capybaraos.kernel
}
EOF
grub-mkrescue -o capybaraos.iso isodir
