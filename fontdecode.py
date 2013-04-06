#!/usr/bin/python2
# encoding: utf-8
# Tämä dekoodaa fontit alkuperäisestä binääristä ja tulostaa bittivirtaa
# näytettäväksi printline_decoder.py:llä.
# käyttö: ./fontdecode.py program.bin H e l l o ' ' w o r l d | ./printline_decoder.py
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

def pad_printline(toprow, botrow):
	"""Paddaa rivit oikean mittaisiksi jos annettu data ei ole tarpeeksi pitkä, syötteenä max. yksi rivi"""
	segments = 4
	segcolumns = 24
	toprows = 12
	botrows = 11

	topbits = segments * segcolumns * toprows
	botbits = segments * segcolumns * botrows

	tops = toprow + "0" * (topbits - len(toprow))
	bots = botrow + "0" * (botbits - len(botrow))

	return "\n".join(tops[::-1] + bots)

def main():
	"""Monta merkkiä yhdelle riville"""
	rawdata = open(argv[1], "rb").read()
	glyphs = extract_glyphs(rawdata)
	chars = argv[2:]
	if chars[0] == "line":
		startoff = int(chars[1])
		charsperline = 19
		chars = map(chr, range(charsperline*startoff, min(255, charsperline*startoff + charsperline)))
	tops, bots = map("".join, zip(*[build_charbits(glyphs, x) for x in chars]))
	print pad_printline(tops, bots)

if __name__ == "__main__":
	main()

