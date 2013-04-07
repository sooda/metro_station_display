#ifndef LCD_FRAMEBUF_H
#define LCD_FRAMEBUF_H

#include <stdint.h>

extern uint8_t imagetop[]; // FIXME: edelleen oikealta vasemmalle
extern uint8_t imagebot[];

#define LCD_BITS_TOT (4 * 24 * 23)
#define LCD_BITS_TOP (4 * 24 * 12)
#define LCD_BITS_BOT (4 * 24 * 11)

void lcd_transmit(uint8_t side, uint8_t row);

#endif
