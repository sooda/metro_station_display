// 8085-emulaattorin syötteeseen on kiva verrata bittejä, näkeepähän meneekö
// täsmälleen oikein. tämä tulostaa jokseenkin samanlaista kuin emulaattorin
// kaappaustiedostot

#include <stdio.h>
#include <stdint.h>

void lcd_out_data(uint8_t yes) {
	fprintf(stderr, "0x42 0x0%d\n", yes != 0);
}

void lcd_out_clktop(void) {
	fprintf(stderr, "0x43 0x01\n");
	fprintf(stderr, "0x43 0x00\n");
}

void lcd_out_clkbot(void) {
	fprintf(stderr, "0x43 0x02\n");
	fprintf(stderr, "0x43 0x00\n");
}

void lcd_sendtop(uint8_t yes) {
	lcd_out_data(yes);
	lcd_out_clktop();
}

void lcd_sendbot(uint8_t yes) {
	lcd_out_data(yes);
	lcd_out_clkbot();
}

void lcd_latch_row(uint8_t side, uint8_t row) {
	fprintf(stderr, "0x43 0x0%d\n", side ? 4 : 0);
	fprintf(stderr, "0x42 0x0%d\n", 1 << (row + 1));
	fprintf(stderr, "0x42 0x00\n");
}
