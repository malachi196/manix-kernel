i686-elf-gcc -ffreestanding -c mkernel.c -o mkernel.o

i686-elf-ld -o mkernel.bin -T ldkernel.ld mkernel.o
