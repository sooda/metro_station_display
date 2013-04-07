#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>

// datanasta C0:ssa, strobet heti sen jälkeen
#define DATAPORT PORTC
#define DATADDR DDRC
#define DATAPIN _BV(0)
#define TOPSTROBEPIN _BV(1)
#define BOTSTROBEPIN _BV(2)
#define DATAPORTMASK (DATAPIN | TOPSTROBEPIN | BOTSTROBEPIN)

// osoite D:n alussa, seitebitti niiden perässä
#define ADDRPORT PORTD
#define ADDRDDR DDRD
#define ADDRROW0 _BV(0)
#define ADDRROW1 _BV(1)
#define ADDRROW2 _BV(2)
#define ADDRSEITE _BV(3)
#define SEITE0 0
#define SEITE1 ADDRSEITE
#define ADDRROWMASK (ADDRROW0 | ADDRROW1 | ADDRROW2)
#define ADDRPORTMASK (ADDRROWMASK | ADDRSEITE)

//#define CLKDELAY() _delay_us(1) // näinkin voi tehdä, mutta kokeillaan nyt noppaamalla tarkasti
// vähempikin toimii, mutta tulee pari virhebittiä
// entä hidastuukohan näyttö esim. pakkasessa?
#define CLKDELAY() __asm__("nop\n\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n\tnop")
#define LATCHDELAY()  __asm__("nop\n\tnop\n\tnop")

static void address(uint8_t seitebit, uint8_t addrbit) {
	ADDRPORT = seitebit | addrbit;
}

void lcd_out_data(uint8_t yes) {
	if (yes)
		DATAPORT |= DATAPIN;
	else
		DATAPORT &= ~DATAPIN;
}

void lcd_out_clktop(void) {
	DATAPORT |= TOPSTROBEPIN;
	CLKDELAY();
	DATAPORT &= ~TOPSTROBEPIN;
}

void lcd_out_clkbot(void) {
	DATAPORT |= BOTSTROBEPIN;
	CLKDELAY();
	DATAPORT &= ~BOTSTROBEPIN;
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
	address(side ? SEITE0 : SEITE1, _BV(row));
	LATCHDELAY();
	address(0, 0);
}
void lcd_init_hw(void) {
	DATADDR = DATAPORTMASK;
	ADDRDDR = ADDRPORTMASK;
}
