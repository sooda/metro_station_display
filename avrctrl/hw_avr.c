#include <avr/power.h>
#include "usbstdio.h"
#include "lcd_hw.h"

void hw_init(void) {
	clock_prescale_set(clock_div_1);
	usbstdio_setup();
	lcd_init_hw();
}
