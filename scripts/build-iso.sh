#!/usr/bin/bash

mkdir -p /tmp/iso/boot &&
    cp mkernel.bin /tmp/iso/boot/ &&
    cp mboot.bin /tmp/iso/boot/ &&

    #genisoimage -o manix.iso -b mboot.bin -c boot/bootcatalog -no-emul-boot -boot-load-size 4 -boot-info-table -R -J /tmp/iso &&
    xorriso -as mkisofs -o manix.iso -b boot/mboot.bin -no-emul-boot -boot-load-size 4 -boot-info-table /tmp/iso &&

    rm -r -f /tmp/iso/ &&
    echo successfully created \"manix.iso\" image
