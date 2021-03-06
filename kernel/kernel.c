#include <stddef.h>
#include <stdint.h>
#include "drivers/video/vga.h"
#include "drivers/cpu/isr.h"
#include "drivers/cpu/idt.h"

//called by the assembly code in boot.S
void kernel_main() {
    screen_initialize();
    screen_writestringat("Alium Kernel", screen_createcursorpos(0, 0));
    screen_writestringat("(c) 2016 - Nick Vernij, all rights reserved", screen_createcursorpos(1, 0));

    screen_setcursorpos(3, 0);
    screen_write(">");

    screen_setcursorpos(5, 0);

    isr_install();
}
