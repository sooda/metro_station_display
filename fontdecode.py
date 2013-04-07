#!/usr/bin/python2
# encoding: utf-8
# Tämä dekoodaa fontit alkuperäisestä binääristä ja tulostaa bittivirtaa
# näytettäväksi printline_decoder.py:llä tai tuupattavaksi hardikselle.
# käyttö: ./fontdecode.py <koodibinääri> <segmenttien määrä> <teksti>
# esim. ./fontdecode.py program.bin 4 'Hello world' | ./printline_decoder.py
# jos teksti on tyhjä, tulostetaan fonttikarttarivi, jonka numero tulee tekstin jälkeen
# esim. ./fontdecode.py program.bin 4 '' 2 | ./printline_decoder.py
from sys import argv

def extract_glyphs(rawdata):
	"""Raa'at tavut ulos ohjelmabinääristä"""
	charsize = 24
	fontstart = 0x6800

	glyphs = []
	for i in range(0x100):
		byteoffset = i * charsize
		pos = fontstart + byteoffset
		glyphs.append(rawdata[pos:pos + charsize])
	return glyphs

def wordstr(x):
	"""16-bittinen sana stringiksi"""
	return ("%016d" % int(bin(x)[len("0b"):]))

def bytes2words(buf):
	"""Tavuvirta 16-bittisiksi sanoiksi"""
	ret = []
	for lo, hi in zip(buf[::2], buf[1::2]):
		ret.append(lo | (hi << 8))
	return ret

def build_charbits(glyphs, char):
	"""Glyyfibitit yhdelle merkille siinä muodossa kuin ne näytölle lähtevät"""
	ch = ord(char)

	bytebuf = map(ord, glyphs[ch])
	words = bytes2words(bytebuf)
	strwords = map(wordstr, words)
	import pprint, sys; pprint.pprint(strwords, sys.stderr) # debug log
	revstr = lambda s: s[::-1]
	low12bits = lambda w: w[4:]
	low11bits = lambda w: w[5:]
	# eka tavu on suoraan merkin indeksi
	# toka tavu sisältää dataa merkin jälkeen jätettävistä väleistä
	# datasanojen yläbitit sisältävät tietoa mm. siitä, voiko sarakkeen skipata
	# sen formaatti ei ole vielä täysin selvillä
	top = "".join(map(lambda x: x, map(low12bits, strwords[2:7])))
	bot = "".join(map(revstr, map(low11bits, strwords[7:12])))
	return (top, bot)

def pad_printline(segments, toprow, botrow):
	"""Paddaa rivit oikean mittaisiksi jos annettu data ei ole tarpeeksi pitkä, syötteenä max. yksi rivi"""
	segcolumns = 24
	toprows = 12
	botrows = 11

	topbits = segments * segcolumns * toprows
	botbits = segments * segcolumns * botrows
	if len(toprow) > topbits: # assume bottom length is consistent
		raise ValueError("Too much bits to display (%.2f %% used)" %
				(100.0 * len(toprow) / topbits))

	tops = toprow + "0" * (topbits - len(toprow))
	bots = botrow + "0" * (botbits - len(botrow))

	return "\n".join(tops[::-1] + bots)

def main():
	"""Monta merkkiä yhdelle riville"""
	rawdata = open(argv[1], "rb").read()
	glyphs = extract_glyphs(rawdata)
	segments = int(argv[2])
	chars = argv[3]
	if chars == "": # erikoismoodi yhden fonttirivin tulostamiseksi
		offset = int(argv[4])
		perline = 19
		start = perline * offset
		end = min(255, perline * (offset + 1))
		chars = map(chr, range(start, end))
	tops, bots = map("".join, zip(*[build_charbits(glyphs, x) for x in chars]))
	print pad_printline(segments, tops, bots)

if __name__ == "__main__":
	main()

