#ifndef LCD_STREAM_H
#define LCD_STREAM_H

#include <stdint.h>

struct lcd {
	uint8_t row;
	uint8_t topbot;
	int col;
	uint8_t repeat;
};

void lcd_init_row(struct lcd* lcd, uint8_t row);
int lcd_col_bits(struct lcd* lcd);
void lcd_stream_next(struct lcd* lcd, uint8_t byte);
void lcd_display_row(struct lcd* lcd, uint8_t side);

#endif
