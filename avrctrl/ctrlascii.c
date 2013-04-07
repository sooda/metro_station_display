// Väylänohjaussofta, syö asciibittejä '0' ja '1' kuten muut debugtyökalut
//
// Vertailuksi alkuperäisestä dumpista:
// 0) make -f Makefile.linux
// 1) cat 3-ulam-hog.txt | egrep '408a|409b|40b4|40c5' | cut -c18 | ./ctrlascii > log
// 2) egrep -v ';| in ' ../3-ulam-hog.txt | cut -d' ' -f3,4 > vertailu
// 3) vimdiff log vertailu, ja käsin kahdeksan ylimääräistä 0x42 0x00 -riviä pois ja täsmää,
//    alkuperäissofta asettaa datan turhaan uusiksi nollaksi kesken täytebittien
//
// Toimii tietysti myös teensyllä virtuaalisarjaportin yli.
// FIXME: näytöt ovat konffattu niin, että molemmat puolet reagoivat samaan
// puolibittiin. Säädä jumpperilla toinen erilliseksi niin side-bitistä on
// jotain hyötyäkin. Nyt tämä päivittää kummankin puolen joka kerta.

#include <stdio.h>
#include "hw_init.h"
#include "lcd_stream.h"
#include "lcd_framebuf.h"

// käytetäänkö streamaavaa tilaa vai bufferoivaa. ei sinänsä väliä, kunhan
// koodasin kaksi erilaista. streamaava ei tarvitse framebufferia rammiin mutta
// puuhaa vähän ylimääräistä pitääkseen kirjaa siitä missä mennään
#define LCD_STREAM 1

uint8_t imagetop[LCD_BITS_TOP / 8];
uint8_t imagebot[LCD_BITS_BOT / 8];

static int getbitchar(void) {
	int c;
	do {
		c = getchar();
	} while (c != '0' && c != '1' && c != 'R');
	putchar(c);
	if (c == 'R') // R-kirjain resettaa tilan, debuggikätevyys++
		c = -1;
	return c;
}

#if LCD_STREAM
static void stream_printline(uint8_t row) {
	struct lcd lcd;
	lcd_init_row(&lcd, row);
	uint16_t sz = lcd_col_bits(&lcd) >> 3;
	for (uint16_t col = 0; col < sz; col++) {
		uint8_t x = 0;
		for (uint8_t i = 0; i < 8; i++) {
			int c = getbitchar();
			if (c == -1) // reset
				return;
			x >>= 1;
			if (c == '1')
				x |= 0x80;
		}
		lcd_stream_next(&lcd, x);
	}
	printf("OK!\r\n");
	lcd_display_row(&lcd, 0);
	lcd_display_row(&lcd, 1);
}
#else
static void framebuf_printline(uint8_t row) {
	int bytestop = LCD_BITS_TOP >> 3;
	int bytestot = LCD_BITS_TOT >> 3;
	if (row == 2) {
		bytestop >>= 1;
		bytestot >>= 1;
	}
	for (int i = 0; i < bytestot; i++) {
		uint8_t x = 0;
		for (int i = 0; i < 8; i++) {
			int c = getbitchar();
			if (c == -1) // reset
				return;
			x >>= 1;
			if (c == '1')
				x |= 0x80;
		}
		if (i < bytestop)
			imagetop[i] = x;
		else
			imagebot[i - bytestop] = x;
	}
	printf("OK!\r\n");
	lcd_transmit(0, row);
	lcd_transmit(1, row);
}
#endif

int main(void) {
	hw_init();
#ifdef LINUX
	// aja yksi syöte ja lopeta
#if LCD_STREAM
	stream_printline(0);
#else
	framebuf_printline(0);
#endif
#else
	// teensyllä vuoronperään eri rivit jatkuvasti
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
#endif
}

