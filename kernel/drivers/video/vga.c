#include <stddef.h>
#include <stdint.h>

//width/height of the vga driver
static const size_t VGA_WIDTH = 80;
static const size_t VGA_HEIGHT = 25;

//screen variables
size_t screen_cursor_row;
size_t screen_cursor_column;
uint8_t screen_color;
uint16_t* screen_buffer;

uint16_t create_vgaentry(char c, uint8_t color) {
    //make them uint16_t
    uint16_t c16 = c;
    uint16_t color16 = color;

    return c16 | color16 << 8;
}

size_t screen_getcursor_row() {
    return screen_cursor_row;
}

size_t screen_getcursor_column() {
    return screen_cursor_column;
}

size_t screen_createcursorpos(size_t y, size_t x) {
    return y * VGA_WIDTH + x;
}

size_t screen_currentcursorpos() {
    return screen_cursor_row * VGA_WIDTH + screen_cursor_column;
}

void screen_clear() {
    //overwrite the whole buffer with spaces
    for (size_t y = 0; y < VGA_HEIGHT; y++) {
        for (size_t x = 0; x < VGA_WIDTH; x++) {
            const size_t index = y * VGA_WIDTH + x; //cursor = position of the character
            screen_buffer[index] = create_vgaentry(' ', screen_color);
        }
    }
}

void screen_colorclear(uint16_t color) {
    //overwrite the whole buffer with spaces
    for (size_t y = 0; y < VGA_HEIGHT; y++) {
        for (size_t x = 0; x < VGA_WIDTH; x++) {
            const size_t index = y * VGA_WIDTH + x; //cursor = position of the character
            screen_buffer[index] = create_vgaentry(' ', color);
        }
    }
}

void screen_initialize() {
    //set the cursor to zero, zero
    screen_cursor_row = 0;
    screen_cursor_column = 0;
    screen_color = 15 | 0 << 4; //white on black
    screen_buffer = (uint16_t*) 0xB8000; //location of all color monitors, 0xB0000 for monochrome monitors

    //fill the screen with empty spaces
    screen_colorclear(screen_color);
}

void screen_writechar(char c, size_t cursor) {
    screen_buffer[cursor] = create_vgaentry(c, screen_color);
}

size_t strlen(const char* str) {
	size_t out = 0;
	while (str[out] != 0)
		out++;
	return out;
}

void screen_writestringat(const char* data, size_t index) {
	size_t datalen = strlen(data);

	for (size_t i = 0; i < datalen; i++)
		screen_writechar(data[i], index + i);
}
