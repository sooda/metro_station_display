#include <stdio.h>
#include "usb_serial.h"

static int myputchar(char c, FILE *stream) {
	(void)stream;
	if (c == '\n')
		usb_serial_putchar('\r');
	return usb_serial_putchar(c);
}

static int mygetchar(FILE *stream) {
	int16_t c;
	(void)stream;
	// just poll for now, don't care about errors/timeouts
	while ((c = usb_serial_getchar()) == -1)
		;
	return c;
}

static FILE mystdin = FDEV_SETUP_STREAM(NULL, mygetchar, _FDEV_SETUP_READ);
static FILE mystdout = FDEV_SETUP_STREAM(myputchar, NULL, _FDEV_SETUP_WRITE);

void usbstdio_setup(void) {
	usb_init();
	while (!usb_configured())
		;
	stdin = &mystdin;
	stdout = &mystdout;
}
