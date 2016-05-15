C_SOURCES = $(wildcard kernel/*.c)
HEADERS = $(wildcard kernel/*.h)
OBJS = kernel/kernel.o kernel/boot.o kernel/drivers/video/vga.o \
	kernel/drivers/ioports.o kernel/drivers/cpu/idt.o kernel/drivers/cpu/isr.o \
	kernel/drivers/cpu/interrupts.o

CC=i686-elf-gcc
CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra -Wunused-parameter

image.bin: ${OBJS}
	${CC} -T linker.ld -o $@ -ffreestanding -O2 -nostdlib ${OBJS} -lgcc

run: image.bin
	qemu-system-i386 -kernel image.bin

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm -felf32 $< -o $@

clean:
	rm -rf *.bin
	rm -rf kernel/*.o
	rm -rf kernel/drivers/video/*.o
	rm -rf kernel/drivers/*.o
