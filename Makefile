C_SOURCES = $(wildcard kernel/*.c)
HEADERS = $(wildcard kernel/*.h)
OBJS = kernel/kernel.o kernel/boot.o kernel/drivers/video/vga.o kernel/drivers/ioports.o

CC=i686-elf-gcc
CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra

image.bin: ${OBJS}
	${CC} -T linker.ld -o $@ -ffreestanding -O2 -nostdlib ${OBJS} -lgcc

run: image.bin
	qemu-system-i386 -kernel image.bin

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.S
	i686-elf-as $< -o $@

clean:
	rm -rf *.bin
	rm -rf kernel/*.o
	rm -rf kernel/drivers/video/*.o
	rm -rf kernel/drivers/*.o
