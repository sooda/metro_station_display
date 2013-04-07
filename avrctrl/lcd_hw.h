#ifndef LCD_HW_H
#define LCD_HW_H

#include <stdint.h>

void lcd_out_data(uint8_t yes);
void lcd_out_clktop(void);
void lcd_out_clkbot(void);
void lcd_sendtop(uint8_t yes);
void lcd_sendbot(uint8_t yes);
void lcd_latch_row(uint8_t side, uint8_t row);
void lcd_init_hw(void);

#endif

