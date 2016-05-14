#include <stddef.h>
#include <stdint.h>
#include "drivers/video/vga.h"

//called by the assembly code in boot.S
void kernel_main() {
    screen_initialize();
    screen_writestringat("Hello, kernel world!!", screen_createcursorpos(0, 0));
}
