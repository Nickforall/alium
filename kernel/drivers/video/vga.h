#include <stddef.h>
#include <stdint.h>
void screen_writestringat(const char* data, size_t index);
void screen_initialize();
size_t screen_createcursorpos(size_t y, size_t x);
size_t screen_currentcursorpos();
size_t screen_getcursor_column();
size_t screen_getcursor_row();
void screen_clear();
void screen_colorclear(uint16_t color);
size_t screen_setcursorpos(size_t y, size_t x);
void screen_writechar(char c);
void screen_write(const char* str);
