i686-elf-gcc -ffreestanding -c mkernel.c -o mkernel.o

i686-elf-ld -o mkernel.elf -T ldkernel.ld mkernel.o

i686-elf-objcopy -O binary mkernel.elf mkernel.bin
