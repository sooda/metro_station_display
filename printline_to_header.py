#!/usr/bin/python2
# encoding: utf-8

# sama inputti kuin printline_decoder.py:n kanssa
# 2208 ykkös-/nollariviä, pura vaikka 3-ulam-hog.txt:stä
# cat 3-ulam-hog.txt | egrep '408a|409b|40b4|40c5' | cut -c18 | ./printline_to_header.py > image.h

import sys

bits = sys.stdin.read().replace('\n', '')
splitIndex = 4 * 24 * 12
bitstop = bits[:splitIndex]
bitsbot = bits[splitIndex:]
bytestop = [bitstop[i:i+8] for i in range(0, len(bitstop), 8)]
bytesbot = [bitsbot[i:i+8] for i in range(0, len(bitsbot), 8)]
# bittirivissä LSB tulee ensin, käännetään siis oikein
contentstop = ["0b" + bits[::-1] for bits in bytestop]
contentsbot = ["0b" + bits[::-1] for bits in bytesbot]
out = "static const unsigned char imagetop[] PROGMEM = {\n\t%s\n};" % ",\n\t".join(contentstop)
out += "\n"
out += "static const unsigned char imagebot[] PROGMEM = {\n\t%s\n};" % ",\n\t".join(contentsbot)
print out
