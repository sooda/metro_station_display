#!/usr/bin/python2
#encoding: utf-8

# Versio 2, soodan pätsäämä, alkuperäinen dezgegiltä
# Dekoodaa tulostusrivin databitit (tasan 2208) kuvaksi.
# Kuva tulostuu metrotext.png:ksi työhakemistoon.
# kello/sekunttivilkutin-rivi on muuten samanlainen mutta puolet lyhyempi

# Syötteen muoto: tasan N * 2208 riviä, joissa joko ykkönen tai nolla.
# yksi kokonainen laitteen rivi vie tuon 2208 bittiä.
# Esimerkiksi:
# cat 3-ulam-hog.txt | egrep '408a|409b|40b4|40c5' | cut -c18 | ./printline_decoder.py
# Myös print-spa{0,1,2}.txt toimivat.
# Myös toimii ./fontdecode.py program.bin H e l l o | ./printline_decoder.py
#
# Pikseleiden mittasuhteet ovat niin oikein kun kännykkäkameralla otetusta lähikuvasta sai mitattua.

import sys
import pygame
import pygame.gfxdraw

topSize = 4 * 24 * 12
botSize = 4 * 24 * 11
totbits = topSize + botSize
# LSB aina ensimmäisenä, eli tavuina ajatellen bitit ovat väärin päin
bits = sys.stdin.read().replace('\n', '')
if len(bits) == 0:
    sys.exit()
numlines = len(bits) / totbits

topstuffs = []
botstuffs = []
for n in range(numlines):
    start = n * totbits

    topstuff = []
    for i in xrange(start, start+topSize, 12):
        topstuff.append(bits[i:i+12])
    # ylärivin *sarakkeet* lähetetään lopusta alkuun, bitit niissä oikein päin
    topstuff = list(reversed(topstuff))

    botstuff = []
    for i in xrange(start+topSize, start+topSize+botSize, 11):
        botstuff.append(bits[i:i+11])

    topstuffs.append(topstuff)
    botstuffs.append(botstuff)

pygame.init()

square = 20 # Ruudun koko, pikseleinä
showborders = True # pikselien reunat eri värillä

# sarakkeiden (24 kpl) väleissä on neljäsosasarakkeen verran tyhjää
sw = int(4 * 24 * 1.25 * 1.0 * square + 0.5)
sh = 8 * numlines * square
screen = pygame.display.set_mode((sw, sh))

# näytön pikselien muotoformaatit:
# katso kuvaa muodot.jpg
w = 200.0 # kokokerroin (sarakkeen leveys kuvasta josta mitat otettu)

# yläpuoli

# height
ah = 150+40
bh = 40+130
ch = 150+30
dh = 45+170

# y pos
ay = 0
by = ah
cy = by + bh
dy = cy + ch
toph = dy + dh

# middle, jossakin, ei kovin yhtenäinen
am = [(0, 150), (w, 150)]
bm = [(0,  by+40), (w, by+40)]
cm = [(0,  cy+150),  (w, cy+150)]
dm = [(0, dy+45), (w, dy+45)]
# monikulmioita, katso muodot.jpg ja mitat.pdf
topgfx = {
    6: [(0, ay), (w/2, ay), am[0]], # TODO ah-1
    5: [(w/2, ay), am[0], (0, by), (w, by), am[1]],
    4: [(w, ay), (w/2, ay), am[1]],

    7: [bm[0], (w/2, cy), (0, cy)],
    3: [(0, by), (w, by), bm[1], (w/2, cy), bm[0]],
    2: [bm[1], (w/2, cy), (w, cy)],

    8: [(0, cy), (w/2, cy), cm[0]],
    9: [(w/2, cy), cm[1], (w, dy), (0, dy), cm[0]],
    1: [(w, cy), (w/2, cy), cm[1]],

   11: [dm[0], (w/2, dy+dh), (0, dy+dh)],
   10: [(0, dy), (w, dy), dm[1], (w/2, dy+dh), dm[0]],
    0: [dm[1], (w/2, dy+dh), (w, dy+dh)]
}

# alapuoli

ah = 140
bh = 150+65
ch = 30+160
dh = 175

ay = 0
by = ah
cy = by + bh
dy = cy + ch

am = [(50, by), (150, by)]
bm = [(0,  by+150), (w, by+150)]
cm = [(0,  cy+30),  (w, cy+30)]
dm = (110, dy+130)
botgfx = {
    0: [(0, ay), (w/2, ay), am[0], (0, ah)],
    9: [(w/2, ay), am[0], am[1]],
   10: [(w, ay), (w/2, ay), am[1], (w, ah)],

    1: [(0, by), am[0], bm[0]],
    2: [am[0], am[1], bm[1], (w, cy), (0, cy), bm[0]],
    8: [(w, by), am[1], bm[1]],

    4: [cm[0], (w/2, dy), (0, dy)],
    3: [(0, cy), (w, cy), cm[1], (w/2, dy), cm[0]],
    7: [cm[1], (w/2, dy), (w, dy)],

    5: [(0, dy), (w, dy), dm, (0, dy+dh)],
    6: [(w, dy), dm, (0, dy+dh), (w, dy+dh)],
}

def plot_polygons(red, row, col, bits, polygons, basey):
    red = []
    for i in xrange(len(bits)):
        if bits[i] == '0':
            continue
        base_x = square * (col * 1.25)
        base_y = square * (8 * row + basey / w)
        points = [(base_x + square * x / w, base_y + square * y / w)
                for x,y in polygons[i]]

        color = (255, 0, 0) if (i in red) else (255, 255, 255)
        bordercolor = (255, 0, 0) if basey else (0, 255, 0)
        pygame.gfxdraw.filled_polygon(screen, points, color)
        if showborders:
            pygame.gfxdraw.polygon(screen, points, bordercolor)


for n, (topstuff, botstuff) in enumerate(zip(topstuffs, botstuffs)):
    for i in xrange(len(topstuff)):
        print topstuff[i]
        plot_polygons([], n, i, topstuff[i], topgfx, 0)

    print '----'

    for i in xrange(len(botstuff)):
        print botstuff[i]
        plot_polygons([], n, i, botstuff[i], botgfx, toph)

    print "===="

pygame.display.flip()
pygame.image.save(screen, "metrotext.png")
while True:
    e = pygame.event.wait()
    if e.type == pygame.QUIT or (e.type == pygame.KEYDOWN and e.key == pygame.K_ESCAPE):
        break
