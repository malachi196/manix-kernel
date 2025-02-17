dd if=/dev/zero of=manix.img bs=512 count=2880
dd if=mboot.bin of=manix.img bs=512 count=1 conv=notrunc
dd if=mkernel.bin of=manix.img bs=512 count=1 seek=1 conv=notrunc