#include <stdint.h>
#include <stddef.h>
#include "timing.h"

uint32_t timing_tick = 0; //the amount of ticks since the kernel time

void timing_dotick(uint32_t tick) {
    timing_tick += tick;
}
