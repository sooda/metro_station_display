#!/usr/bin/python2
# encoding: utf8

# lähetä kaikki kolme riviä kerralla
# inputtina vastaava riviformaatti kuin aiemminkin (ylärivi takaperin jne)
# mutta kymmenen moduulin verran (10 * 24 saraketta), koko näyttö vasemmalta
# oikealle ylhäältä alas, kätevämpää näin

# esim. ../fontdecode.py ../program.bin 10 "helloworld 01234567890  moi toinen rivi t{ss{" 2>/dev/null | xargs | sed 's/ //g' | ./transmit_whole.py /dev/ttyACM0

# NOTE: Tämä grafiikka nyt vain toisella puolella ok, toisellahan kolmosrivi
# on oikealla ja toisella vasemmalla! Toisen puolen haaroitinlevyjen
# seite-jumpperit pitää säätää.

import serial
import sys
import signal

# ctrl+c-trappays, muuten jää helposti epäsynkkaan esim. bufroll.sh:lla
# jos käyttäjä keskeyttää niin tulostetaan silti rivit loppuun asti ensin
retcode = 0
def ctrlc(signal, frame):
	global retcode
	retcode = 1
signal.signal(signal.SIGINT, ctrlc)

# teensyä ei kiinnosta virtuaalisarjaportin nopeus, kunhan on joku luku, siirtyy täysillä kuitenkin
s = serial.Serial(sys.argv[1], 115200)

MODULEBITSTOP = 24 * 12
MODULEBITSBOT = 24 * 11

for line in sys.stdin:
	asciibits = line.strip()
	bytechunks = [asciibits[i:i+8] for i in range(0, len(asciibits), 8)]
	bytevals = map(lambda x: int(x[::-1], 2), bytechunks) # lsb first, flippaa
	bytestr = "".join(map(chr, bytevals))
	split = 10 * MODULEBITSTOP / 8
	top = bytestr[:split]
	bot = bytestr[split:]
	# toistaiseksi oikein vain puolella jossa vika rivi vasemmalla
	top = top[::-1]
	def tops(a, b):
		return top[a*MODULEBITSTOP/8:b*MODULEBITSTOP/8]
	def bots(a, b):
		return bot[a*MODULEBITSBOT/8:b*MODULEBITSBOT/8]
	row1 = tops(1,  5)[::-1] + bots(1, 5)
	row2 = tops(6, 10)[::-1] + bots(6, 10)
	row3 = (tops(0, 1) + tops(5, 6))[::-1] + bots(0, 1) + bots(5, 6)
	s.write(row1 + row2 + row3)
	if retcode == 1:
		sys.exit(1)
