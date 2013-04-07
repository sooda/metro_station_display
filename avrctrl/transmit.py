#!/usr/bin/python2
# encoding: utf8
# asciiprotokollalla ylä- ja alariville samat tekstit ja reunarivi tyhjäksi
# inputti: riveittäin ykkösiä ja nollia, jokainen yhden rivin mittainen
# esim yksi rivi: ../fontdecode.py ../program.bin 4 helloworld 2>/dev/null | xargs | sed 's/ //g' | ./transmit.py /dev/ttyACM0
# tälle tuleva syöte kelpaa kyllä asciilukijalle sellaisenaankin, sedin
# jälkeisen putken ja lopun rivin tilalle "> /dev/ttyACM0" vaan.
import serial
import sys
# teensyä ei kiinnosta virtuaalisarjaportin nopeus, kunhan on joku luku, siirtyy täysillä kuitenkin
s = serial.Serial(sys.argv[1], 115200)
for line in sys.stdin:
	bits = line.strip()
	s.write(bits) # rivi 1
	s.write(bits) # rivi 2
	# kolmas rivi tyhjäksi kun se on niin nihkeästi reunalla
	s.write("0" * (2 * 24 * 23))
