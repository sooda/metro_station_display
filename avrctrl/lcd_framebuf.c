#include "lcd_framebuf.h"
#include "lcd_hw.h"

static int byte;
static uint8_t bit;

static void topcol(void) {
	for (uint8_t colbit = 0; colbit < 12; colbit++) {
		uint8_t x = imagetop[byte] & bit;
		lcd_sendtop(x);
		bit <<= 1;
		if (!bit) {
			bit = 1;
			byte++;
		}
	}
}
static void botcol(void) {
	for (uint8_t colbit = 0; colbit < 11; colbit++) {
		uint8_t x = imagebot[byte] & bit;
		lcd_sendbot(x);
		bit <<= 1;
		if (!bit) {
			bit = 1;
			byte++;
		}
	}
}
static void padtop(uint8_t n) {
	lcd_out_data(0);
	while (n--)
		lcd_out_clktop();
}

static void padbot(uint8_t n) {
	lcd_out_data(0);
	while (n--)
		lcd_out_clkbot();
}

void lcd_transmit(uint8_t side, uint8_t row) {
	byte = 0;
	bit = 1;
	for (int colblk = 0; colblk < (row == 2 ? 8 : 16); colblk++) { // 16 * 6 = 96 = 4 * 24
		padtop(4);
		for (int c = 0; c < 6; c++) topcol();
		padtop(4);
	}
	byte = 0;
	bit = 1;
	for (int colblk = 0; colblk < (row == 2 ? 2 : 4); colblk++) { // 4 * (4 + 10 + 10) = 96
		padbot(36);
		for (int c = 0; c <  4; c++) botcol();
		padbot(5);
		for (int c = 0; c < 10; c++) botcol();
		padbot(10);
		for (int c = 0; c < 10; c++) botcol();
		padbot(5);
	}
	lcd_latch_row(side, row);
}
