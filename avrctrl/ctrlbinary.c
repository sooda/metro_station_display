// Väylänohjaussofta kuten ctrlascii.c:kin, mutta tämä syö sarjaportin tavuja
// suoraan, niin päivittyy nopeammin. Syöte tulee transmit_whole.py:n kautta.
#include <stdio.h>
#include "hw_init.h"
#include "lcd_stream.h"
#include "lcd_framebuf.h"

#define LCD_STREAM 1

#if LCD_STREAM
static void stream_printline(uint8_t row) {
	struct lcd lcd;
	lcd_init_row(&lcd, row);
	uint16_t sz = lcd_col_bits(&lcd) >> 3;
	for (uint16_t col = 0; col < sz; col++) {
		uint8_t x = getchar();
		putchar(x);
		lcd_stream_next(&lcd, x);
	}
	printf("OK!\r\n");
	lcd_display_row(&lcd, 0);
	lcd_display_row(&lcd, 1);
}
#else
uint8_t imagetop[LCD_BITS_TOP / 8];
uint8_t imagebot[LCD_BITS_BOT / 8];

static void framebuf_printline(uint8_t row) {
	int bytestop = LCD_BITS_TOP >> 3;
	int bytesbot = LCD_BITS_BOT >> 3;
	if (row == 2) {
		bytestop >>= 1;
		bytesbot >>= 1;
	}
	for (int i = 0; i < bytestop; i++)
		putchar(imagetop[i] = getchar());
	for (int i = 0; i < bytesbot; i++)
		putchar(imagebot[i] = getchar());
	printf("OK!\r\n");
	lcd_transmit(0, row);
	lcd_transmit(1, row);
}
#endif

int main(void) {
	hw_init();
	for (;;) {
#if LCD_STREAM
		stream_printline(0);
		stream_printline(1);
		stream_printline(2);
#else
		framebuf_printline(0);
		framebuf_printline(1);
		framebuf_printline(2);
#endif
	}
}
