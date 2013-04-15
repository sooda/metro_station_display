#!/usr/bin/python2
#encoding: utf-8

# Piirto-ohjelma graffan tunkkaamiseksi hiirellä.  Piirtää yhtä riviä pikseli
# pikseliltä, lataa myös taustalle kuvan, kun sellainen komentoriviparametrina
# tulee, ja approksimoi siitä pikselit. Hiiren vasen nappi piirtää ja oikea
# pyyhkii. Keskinappi vaihtaa pistepiirrosta ympyräpiirtoon ja takaisin, hiiren
# rulla säätää ympyrän kokoa.

# Välilyönti tulostaa pikselit stdoutiin siinä tutussa muodossa.
# Kokeile ./printline_encoder.py taustakuva.png | ../printline_decoder.py
# (taustakuva on pakollinen, luo vaikka printline_decoderilla (se luo
# metroscreen.png:n))

# Kommentit epäjohdonmukaisesti englanniksi, mutta eihän koodaaminen onnistu suomeksi.

import sys
import pygame
from math import ceil
from metroscreen import Screen, Column, Pgdraw

class App(object):
    """The drawing app, not _directly_ related to metro screen bit handling"""
    square = 20 # Width of one lcd column in pixels
    # bit masks, or'd together
    DRAW_ENABLED = 1 # affect bits?
    DRAW_PAINT = 2 # paint bits on or off?
    DRAW_CIRCLE = 4 # circle mode?
    def __init__(self):
        self.lcd = Screen(4) # Same amount as in printline_decoder.py for debugging with it
        sw, sh = self.lcd.dimensions()
        screensize = (int(self.square * sw + 0.5), int(self.square * sh + 0.5))
        self.screen = pygame.display.set_mode(screensize)
        self.lcddraw = Pgdraw(self.square, self.screen)
        self.source = pygame.image.load(sys.argv[1])
        self.drawmode = self.DRAW_CIRCLE
        self.drawsize = 20
        self.lastmouse = None
        self.lcd.import_pic(self.source, self.square)
        self.repaint()

    def repaint(self):
        """Paint the whole screen again"""
        self.screen.blit(self.source, (0, 0))
        self.lcd.draw(self.lcddraw)
        if self.drawmode & self.DRAW_CIRCLE:
            self.plot_circle()
        pygame.display.flip()

    def click_bit(self, pos):
        """Toggle just one bit and repaint the corresponding column"""
        pos = self.lcddraw.map_from(pos)
        bit = self.lcd.flipbit(pos, self.drawmode & self.DRAW_PAINT)

        if bit is not None:
            if not self.drawmode & self.DRAW_PAINT:
                # print background
                col = bit // Column.BITS
                topleft = (self.square * col * Column.REALWIDTH, 0)
                rect = topleft + (self.square * Column.REALWIDTH, self.square * Column.height())
                self.screen.blit(self.source, topleft, rect)

            # this prints whole column
            self.lcd.draw(self.lcddraw, bit)
            pygame.display.flip()

    def apply_click(self, pos):
        """Do something when mouse has been clicked"""
        if self.drawmode & self.DRAW_CIRCLE:
            self.click_bits(pos)
        else:
            self.click_bit(pos)

    def plot_circle(self):
        """Print the helpful circle brush, if the point is available"""
        if self.lastmouse is not None:
            pygame.gfxdraw.circle(self.screen,
                    self.lastmouse[0], self.lastmouse[1],
                    int(self.drawsize), (255, 0, 255))

    def click_bits(self, pos):
        """Toggle all bits inside the mouse circle and repaint them"""
        if self.lastmouse is None:
            # skip initial draw with nothing to clear
            self.lastmouse = pos
            return
        # need to update all interior bits
        # just repaint the whole columns that the updated region overlaps
        # note that we need to wipe out the last circle also
        mousex0 = min(self.lastmouse[0], pos[0])
        mousex1 = max(self.lastmouse[0], pos[0])
        mousey0 = min(self.lastmouse[1], pos[1])
        mousey1 = max(self.lastmouse[1], pos[1])

        # map background positions to column borders
        x0 = int((mousex0 - self.drawsize) / float(self.square) / Column.REALWIDTH)
        x1 = int((mousex1 + self.drawsize) / float(self.square) / Column.REALWIDTH) + 1
        x0 *= Column.REALWIDTH
        x1 *= Column.REALWIDTH
        w = x1 - x0

        #self.screen.fill(0) # debug mode
        rectpos = (int(self.square * x0), 0)
        rectsiz = (int(self.square * w), ceil(self.square * Column.height()))
        self.screen.blit(self.source, rectpos, rectpos + rectsiz)

        if self.drawmode & self.DRAW_ENABLED:
            # update bit values, no drawing yet
            mousepos = self.lcddraw.map_from(pos)
            r = self.drawsize / float(self.square)
            yes = self.drawmode & self.DRAW_PAINT
            self.lcd.flipbits(mousepos, r, yes)

        # redraw the column data
        region = [(mousex0 - self.drawsize, mousey0 - self.drawsize),
                  (mousex1 + self.drawsize, mousey1 + self.drawsize)]
        region = map(self.lcddraw.map_from, region)
        self.lcd.draw(self.lcddraw, region=region)

        self.lastmouse = pos
        self.plot_circle()

        pygame.display.flip()


    def doevent(self, e):
        """Pygame event handler"""
        # assume just one mouse button at once
        if e.type == pygame.QUIT:
            return False
        elif e.type == pygame.KEYDOWN:
            if e.key == pygame.K_ESCAPE:
                return False
            if e.key == pygame.K_SPACE:
                print "\n".join(self.lcd.machinebits())
        elif e.type == pygame.MOUSEBUTTONDOWN:
            if e.button == 1:
                self.drawmode |= self.DRAW_PAINT | self.DRAW_ENABLED
                self.apply_click(e.pos)
            if e.button == 2:
                self.drawmode ^= self.DRAW_CIRCLE
                self.repaint()
            elif e.button == 3:
                self.drawmode |= self.DRAW_ENABLED
                self.lastmouse = e.pos
                self.apply_click(e.pos)
            elif e.button == 4:
                if self.drawsize < self.square * Column.height() / 2:
                    self.drawsize *= 1.1
                    self.repaint()
            elif e.button == 5:
                if self.drawsize > 5:
                    self.drawsize /= 1.1
                    self.repaint()
        elif e.type == pygame.MOUSEMOTION:
            if self.drawmode:
                self.apply_click(e.pos)
        elif e.type == pygame.MOUSEBUTTONUP:
            self.drawmode &= ~(self.DRAW_PAINT | self.DRAW_ENABLED)
        return True

    def run(self):
        while self.doevent(pygame.event.wait()):
            pass

def main():
    pygame.init()
    a = App()
    a.run()

if __name__ == "__main__":
    main()
