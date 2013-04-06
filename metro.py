from serial import Serial
from time import sleep

ser = Serial("/dev/ttyUSB0", 600, 7, 'E', 1)
STX = chr(2)
ETX = chr(3)
EOT = chr(4)
ENQ = chr(5)
NL = chr(13)
PAD = chr(127)

addr = "01" # low bit says write

def wr(x):
	#ser.write(x) # pad bytes seem necessary
	ser.write(PAD + PAD + x + PAD + PAD) # nl is not needed
	#ser.write(PAD + PAD + x + PAD + PAD + NL) # though works with it too

slp = 1 # sometimes even smaller works, sometimes need to retry with this
wr(EOT)
sleep(slp)
wr(addr + ENQ)
sleep(slp)
mode = 3
if mode == 0: # load text
	n = "01" # default (timeout)
	ver = "004"
	site = "2" # 1=one side blinks in a broken way, 2=both work, 3=no clock on other side
	secs = "42"
	traingfx = "16"
	wr(STX + "x" + site + ver + "xxE" + secs + traingfx + n + n + "RL30" + ETX + "p")
elif mode == 1: # clear screen
	row = "0"
	side = "1"
	ver = "004"
	wr(STX + row + side + ver + "00N" + ETX + "p")
elif mode == 2: # download text (not tested)
	row = "1"
	col = "B"
	ver = "004"
	mempos = "01"
	wr(STX + row + col + ver + mempos + "D ++ Timeout +12345" + ETX + "p")
elif mode == 3: # display text immediately
	# version?
	# sbn: text type
	# lrmz: left right middle something
	row = "2" # 1=top, 2=bottom, 3=clock
	side = "2" # wtf?
	# b=caps, s=big spaces, n=big text
	wr(STX + row + side + "000nlT:---D 8---D" + ETX + "p")
sleep(slp)
wr(EOT)
print "ok"
