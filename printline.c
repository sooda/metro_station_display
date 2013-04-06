// staattinen kuva lcd-näytölle juttelemalla suoraan väylälle
// luo kuva printline_to_header.py:n avulla
// testattu teensy++ 2.0:lla @ 16 MHz

#include <avr/io.h>
#include <avr/power.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <stdint.h>

#include "image.h"

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

//#define CLKDELAY() _delay_us(1) // näinkin voi tehdä, mutta kokeillaan nyt nopeilla tarkasti
// vähempikin toimii, mutta tulee pari virhebittiä
// hidastuukohan näyttö esim. pakkasessa?
#define CLKDELAY() __asm__("nop\n\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n\tnop")
#define LATCHDELAY() __asm__("nop\n\tnop\n\tnop")

void address(int seitebit, int addrbit) {
	ADDRPORT = seitebit | addrbit;
}

void data(int yes) {
	if (yes)
		DATAPORT |= DATAPIN;
	else
		DATAPORT &= ~DATAPIN;
}
void strobetop(void) {
	DATAPORT |= TOPSTROBEPIN;
	CLKDELAY();
	DATAPORT &= ~TOPSTROBEPIN;
}
void strobebot(void) {
	DATAPORT |= BOTSTROBEPIN;
	CLKDELAY();
	DATAPORT &= ~BOTSTROBEPIN;
}
void sendtop(int yes) {
	data(yes);
	strobetop();
}
void sendbot(int yes) {
	data(yes);
	strobebot();
}

int byte, bit, jekku;

void topcol(void) {
	for (int colbit = 0; colbit < 12; colbit++) {
		unsigned int x = pgm_read_byte(&imagetop[byte]) & bit;
		if (jekku) x = !x;
		sendtop(x);
		bit <<= 1;
		if (!(bit & 0xff)) {
			bit = 1;
			byte++;
		}
	}
}
void botcol(void) {
	for (int colbit = 0; colbit < 11; colbit++) {
		unsigned int x = pgm_read_byte(&imagebot[byte]) & bit;
		if (jekku) x = !x;
		sendbot(x);
		bit <<= 1;
		if (!(bit & 0xff)) {
			bit = 1;
			byte++;
		}
	}
}

int main(void) {
	clock_prescale_set(clock_div_1);
	DATADDR = DATAPORTMASK;
	ADDRDDR = ADDRPORTMASK;
	// jekku vilkuttaa näyttöä käänteiseksi yo. funktioissa
	jekku = 0;
	int div = 5;
	int max = 20;
	unsigned char blinkcnt = 0;
	for (;;) {
		for (int rivi = 0; rivi < 3; rivi++) {
			byte = rivi == 2 ? (2*24*12 / 8) : 0; // reunarivihän oli muita lyhyempi, skippaa kaksi moduulia
			bit = 1;
			for (int colblk = 0; colblk < (rivi == 2 ? 8 : 16); colblk++) { // 16 * 6 = 96 = 4 * 24
				for (int p = 0; p < 4; p++) sendtop(0);
				for (int c = 0; c < 6; c++) topcol();
				for (int p = 0; p < 4; p++) sendtop(0);
			}
			byte = 0;
			bit = 1;
			for (int colblk = 0; colblk < (rivi == 2 ? 2 : 4); colblk++) { // 4 * (10 + 10 + 4) = 96
				for (int p = 0; p < 36; p++) sendbot(0);
				for (int c = 0; c <  4; c++) botcol();
				for (int p = 0; p <  5; p++) sendbot(0);
				for (int c = 0; c < 10; c++) botcol();
				for (int p = 0; p < 10; p++) sendbot(0);
				for (int c = 0; c < 10; c++) botcol();
				for (int p = 0; p <  5; p++) sendbot(0);
			}
			address(SEITE0, _BV(rivi));
			LATCHDELAY();
			address(0, 0);
		}
		jekku = blinkcnt < div;
		blinkcnt++;
		if (blinkcnt == max) blinkcnt = 0;
	}
}


