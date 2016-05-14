# VGA drivers

The VGA driver is a driver that lets you print characters on-screen.

### void screen_writestringat(const char* data, size_t index);
* `data` A string to print
* `index` The index on the screen to print, should be created with `screen_createcursorpos(y, x)`.

### void screen_initialize();
* Called by the kernel to initialize video memory

### size_t screen_createcursorpos(size_t y, size_t x);
* Creates an index of a cursor
* `y` The row of the index
* `x` The column of the index

### size_t screen_currentcursorpos();
* Get the current index of the cursor

### size_t screen_getcursor_column();
* Get the current column of the cursor

### size_t screen_getcursor_row();
* Get the current row of the cursor

### void screen_clear();
* Clears the screen to the current terminal color

### void screen_colorclear(uint16_t color);
* Clears the screen with a given color
* `color` The color, color API functions are not yet implemented but colors can be created with `15 | 0 << 4`, which makes black (0) on white (15). Color code table below.

## Resources

### Writing a hello world!

```c
screen_colorclear(15 | 0 << 4); //black on white clear
size_t position = screen_createcursorpos(0, 0);
screen_writestringat("Hello, kernel world!!", );
```

### VGA color enum
```c
enum vga_color {
	COLOR_BLACK = 0,
	COLOR_BLUE = 1,
	COLOR_GREEN = 2,
	COLOR_CYAN = 3,
	COLOR_RED = 4,
	COLOR_MAGENTA = 5,
	COLOR_BROWN = 6,
	COLOR_LIGHT_GREY = 7,
	COLOR_DARK_GREY = 8,
	COLOR_LIGHT_BLUE = 9,
	COLOR_LIGHT_GREEN = 10,
	COLOR_LIGHT_CYAN = 11,
	COLOR_LIGHT_RED = 12,
	COLOR_LIGHT_MAGENTA = 13,
	COLOR_LIGHT_BROWN = 14,
	COLOR_WHITE = 15,
};
```
