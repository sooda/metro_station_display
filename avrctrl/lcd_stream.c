#include "lcd_stream.h"
#include "lcd_hw.h"

#define LCD_BITS_TOTAL (4 * 24 * 23)

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

static uint8_t lcd_stream_bit_top(struct lcd* lcd, uint8_t bit) {
	if (lcd->col == 0)
		padtop(4);

	lcd_sendtop(bit);

	if (++lcd->col == 6*12) {
		padtop(4);
		lcd->col = 0;
		return 1;
	}
	return 0;
}

static uint8_t lcd_stream_bit_bot(struct lcd* lcd, uint8_t bit) {
	if (lcd->col == 0)
		padbot(36);
	else if (lcd->col == 4*11)
		padbot(5);
	else if (lcd->col == 4*11 + 10*11)
		padbot(10);

	lcd_sendbot(bit);

	if (++lcd->col == 4*11 + 10*11 + 10*11) {
		padbot(5);
		lcd->col = 0;
		return 1;
	}
	return 0;
}

static uint8_t lcd_stream_bit(struct lcd* lcd, uint8_t bit) {
	if (lcd->topbot == 0) {
		if (lcd_stream_bit_top(lcd, bit)) {
			if (++lcd->repeat == (lcd->row < 2 ? 16 : 8)) {
				lcd->repeat = 0;
				return 1;
			}
		}
	} else {
		if (lcd_stream_bit_bot(lcd, bit)) {
			if (++lcd->repeat == (lcd->row < 2 ? 4 : 2)) {
				lcd->repeat = 0;
				return 1;
			}
		}
	}
	return 0;
}

void lcd_init_row(struct lcd* lcd, uint8_t row) {
	lcd->row = row;
	lcd->topbot = 0;
	lcd->col = 0;
	lcd->repeat = 0;
}

int lcd_col_bits(struct lcd* lcd) {
	return (lcd->row < 2) ? LCD_BITS_TOTAL : LCD_BITS_TOTAL >> 1;
}

void lcd_stream_next(struct lcd* lcd, uint8_t byte) {
	for (uint8_t i = 0; i < 8; i++) {
		if (lcd_stream_bit(lcd, byte & 1))
			lcd->topbot ^= 1;
		byte >>= 1;
	}
}

void lcd_display_row(struct lcd* lcd, uint8_t side) {
	lcd_latch_row(side, lcd->row);
}
