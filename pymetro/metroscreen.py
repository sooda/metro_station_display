#encoding: utf-8

# Pieni yleiskirjasto metrografiikan kanssa puljaamiseen
# näytön pikselien muotoformaatit: katso kuvaa muodot.jpg

import pygame
import pygame.gfxdraw
import math

def dict2list(d):
    return map(lambda pair: pair[1], sorted(d.items(), key=lambda pair: pair[0]))

_scale = 200.0 # width measurement from the pic
def _build_top():
    """Top part polygon computation"""
    # height
    ah = 150 + 40
    bh = 40 + 130
    ch = 150 + 30
    dh = 45 + 170

    # y pos
    ay = 0
    by = ah
    cy = by + bh
    dy = cy + ch
    toph = dy + dh

    w = _scale
    # middle, according to the pic, not very consistent
    am = [(0, 150), (w, 150)]
    bm = [(0,  by+40), (w, by+40)]
    cm = [(0,  cy+150),  (w, cy+150)]
    dm = [(0, dy+45), (w, dy+45)]
    # polygons
    return (toph, map(lambda poly: _scale_points(poly, 1 / _scale), dict2list({
        6: [(0, ay), (w/2, ay), am[0]],
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
    })))

def _build_bot():
    """Bottom part, as above"""
    ah = 140
    bh = 150 + 65
    ch = 30 + 160
    dh = 175

    ay = 0
    by = ah
    cy = by + bh
    dy = cy + ch
    both = dy + dh

    w = _scale
    am = [(50, by), (150, by)]
    bm = [(0,  by+150), (w, by+150)]
    cm = [(0,  cy+30),  (w, cy+30)]
    dm = (110, dy+130)
    return (both, map(lambda poly: _scale_points(poly, 1 / _scale), dict2list({
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
    })))

def _scale_points(points, scale):
    """Multiply a list of 2d vectors by a scalar"""
    return [(x * scale, y * scale) for x, y in points]

def _sum_points(points, add):
    """Sum a 2d vector to a list of 2d vectors"""
    return [((add[0] + x), (add[1] + y)) for x, y in points]

_toph, _topgfx = _build_top()
_both, _botgfx = _build_bot()

def point_in_poly(point, poly):
    """Test if a point is inside a polygon"""
    # http://en.wikipedia.org/wiki/Even-odd_rule
    # x,y -- x and y coordinates of point
    # a list of tuples [(x,y), (x, y), ...]
    num = len(poly)
    j = num-1
    c = False
    x, y = point
    for i in range(num):
        if ((poly[i][1] > y) != (poly[j][1] > y)) and \
                (x < (poly[j][0] - poly[i][0]) * (y - poly[i][1]) / (poly[j][1] - poly[i][1]) + poly[i][0]):
            c = not c
        j = i
    return c

def point_to_lineseg(p, a, b):
    """Smallest distance from a point to a line segment"""
    # project the point to the line
    # then check if we can parameterize it inside [0,1]
    # nice simple vector math
    ap = (p[0] - a[0], p[1] - a[1])
    ab = (b[0] - a[0], b[1] - a[1])
    dot = ap[0] * ab[0] + ap[1] * ab[1]
    dot /= ab[0] * ab[0] + ab[1] * ab[1]
    if dot < 0:
        return math.hypot(ap[0], ap[1])
    if dot > 1:
        return math.hypot(p[0] - b[0], p[1] - b[1])
    proj = a[0] + dot * ab[0], a[1] + dot * ab[1]
    return math.hypot(p[0] - proj[0], p[1] - proj[1])

def point_to_polygon(point, poly):
    """Smallest distance from a point to a polygon"""
    mindist = 999999 # HACK
    num = len(poly)
    j = num-1
    for i in range(num):
        dist = point_to_lineseg(point, poly[j], poly[i])
        mindist = min(mindist, dist)
        j = i
    return mindist

def overlap_1d(a, b):
    """take regions a and b like [min, max], test if overlap"""
    # max(starts) < min(ends) if overlap
    return max(a[0], b[0]) <= min(a[1], b[1])

def count_area(src, poly):
    """Naive polygon fill algorithm for calculating the pixels in src inside poly"""
    poly = [(float(x), float(y)) for x, y in poly]
    miny = min(poly, key=lambda x: x[1])[1]
    maxy = max(poly, key=lambda x: x[1])[1]
    tot = 0
    on = 0
    for y in range(int(miny), int(maxy)):
        xs = []
        j = len(poly) - 1
        for i in range(len(poly)):
            a = poly[j]
            b = poly[i]
            # point between the line segment's heads
            if (a[1] < y) != (b[1] < y):
                if b[1] - a[1] != 0: # skip horizontal lines
                    # build the vector's x
                    t = (y - a[1]) / (b[1] - a[1])
                    x = a[0] + t * (b[0] - a[0])
                    xs.append(x)
            j = i

        # it's convex, should hit only two lines
        if len(xs) == 2:
            a = min(xs)
            b = max(xs)
            # just truncate the coords, pixels on the right belong to the next col
            for x in range(int(a), int(b)):
                c = src.get_at((x, y))
                if c[0] > 127 or c[1] > 127 or c[2] > 127: # count colorful enough pixels in
                    on += 1
                tot += 1
        elif len(xs) != 0:
            raise RuntimeError("polygon walk is buggy")

    if tot == 0:
        raise RuntimeError("No pixels!")

    return float(on) / tot

class Column(object):
    """Contains gfx in "screen" coordinates (width of one col is 1, but the positions are translated correctly)"""
    TOPBITS = 12
    BOTBITS = 11
    BITS = 23
    REALWIDTH = 1.25 # there's 0.25*width amount of empty space between the cols
    def __init__(self, x, y):
        """x ja y are the inder numbers, not coordinates"""
        def scale(l, x, y):
            return [_sum_points(v, (Column.REALWIDTH * x, y)) for v in l]
        self._topgfx = scale(_topgfx, x, y)
        self._botgfx = scale(_botgfx, x, _toph / _scale)
        self._x = x
        self._y = y

    @staticmethod
    def height():
        """When width is 1, what is the height?"""
        return (_toph + _both) / _scale

    def draw(self, surface, bits, region=None):
        """Draw all the bits inside this column, restrict to region if given"""
        if region is not None:
            own_xregion = (self._x * Column.REALWIDTH, (self._x+1) * Column.REALWIDTH)
            mouse_xregion = (region[0][0], region[1][0])
            if not overlap_1d(own_xregion, mouse_xregion):
                return
        self._plot_gfx(surface, self._topgfx, (0, 255, 0), bits[:Column.TOPBITS])
        self._plot_gfx(surface, self._botgfx, (255, 0, 0), bits[Column.TOPBITS:])

    def _plot_gfx(self, surface, gfx, color, bits):
        """Just print polygons"""
        for bit, points in zip(bits, gfx):
            if bit == '1':
                surface.filled_polygon(points, (128, 128, 128))
            surface.polygon(points, color)

    def _contains(self, point):
        """Is point inside this column? return bit number if it is, otherwise None"""
        if point[0] < self._x * Column.REALWIDTH or point[0] >= (self._x + 1) * Column.REALWIDTH:
            return
        for i, poly in enumerate(self._topgfx):
            if point_in_poly(point, poly):
                return i
        for i, poly in enumerate(self._botgfx):
            if point_in_poly(point, poly):
                return Column.TOPBITS + i

    def _is_near(self, point, r):
        """Return bit numbers that are within the distance r from point"""
        own_xregion = (self._x * Column.REALWIDTH, (self._x+1) * Column.REALWIDTH)
        if not overlap_1d(own_xregion, (point[0] - r, point[0] + r)):
            return []

        affected = []
        for i, poly in enumerate(self._topgfx):
            if point_to_polygon(point, poly) <= r:
                affected.append(i)
        for i, poly in enumerate(self._botgfx):
            if point_to_polygon(point, poly) <= r:
                affected.append(Column.TOPBITS + i)
        return affected

    def __repr__(self):
        return "Column(%d, %d)" % (self._x, self._y)

class Segment(object):
    """Segment is 24 columns"""
    COLS = 24
    BITS = 24 * Column.BITS
    def __init__(self, x, y):
        self._cols = [Column(Segment.COLS * x + i, y) for i in range(Segment.COLS)]
        self._x = x
        self._y = y

    def draw(self, surface, bits, onlycol=None, region=None):
        """Draw all columns inside this segment"""
        if onlycol is not None:
            self._cols[onlycol].draw(surface, bits[Column.BITS*onlycol : Column.BITS*(onlycol+1)])
            return
        for i, col in enumerate(self._cols):
            col.draw(surface, bits[Column.BITS*i : Column.BITS*(i+1)], region)

    def _contains(self, point):
        """Return bit number if point hits any bit"""
        for i, col in enumerate(self._cols):
            n = col._contains(point)
            if n is not None:
                return Column.BITS * i + n

    def _is_near(self, point, r):
        """Return bit numbers that are within the distance r from point"""
        affected = []
        for i, col in enumerate(self._cols):
            bs = col._is_near(point, r)
            for b in bs:
                affected.append(Column.BITS * i + b)
        return affected

    def __repr__(self):
        return "Segment(%d, %d)" % (self._x, self._y)

class Screen(object):
    """Screen consists of some amount of segments"""
    def __init__(self, size):
        self._size = size
        self._segs = [Segment(x, 0) for x in range(size)]
        self._bits = ['0'] * (Segment.COLS * Column.BITS * size)

    def draw(self, surface, onlybit=None, region=None):
        """Draw everything to the given surface, or just one bit or a horizontal region if given"""
        if onlybit is not None:
            seg = onlybit // Segment.BITS
            col = (onlybit % Segment.BITS) / Column.BITS
            self._segs[seg].draw(surface, self._bits[Segment.BITS*seg : Segment.BITS*(seg+1)], col)
        else:
            for i, seg in enumerate(self._segs):
                seg.draw(surface, self._bits[Segment.BITS*i : Segment.BITS*(i+1)], region=region)

    def dimensions(self):
        """Normalized size such that the column width is 1"""
        return (self._size * Segment.COLS * Column.REALWIDTH, Column.height())

    def flipbit(self, pos, state):
        """Toggle one bit at position pos"""
        for i, seg in enumerate(self._segs):
            n = seg._contains(pos)
            if n is not None:
                self._bits[Segment.BITS * i + n] = '1' if state else '0'
                return Segment.COLS * Column.BITS * i + n

    def flipbits(self, pos, r, state):
        """Toggle all bits inside sphere r at pos"""
        affected = []
        for i, seg in enumerate(self._segs):
            bs = seg._is_near(pos, r)
            for b in bs:
                bi = Segment.BITS * i + b
                self._bits[bi] = '1' if state else '0'
                affected.append(bi)
        return affected

    def import_pic(self, src, square):
        """Read pixels in pic and map them to the bit polygons"""
        bits = []
        for seg in self._segs:
            for col in seg._cols:
                for poly in col._topgfx + col._botgfx:
                    poly = [(x * square, y * square) for x,y in poly]
                    bitstate = count_area(src, poly) > 0.5
                    bits.append('1' if bitstate else '0')
        self._bits = bits

    def machinebits(self):
        """Dump internal bit array to the bus bit format"""
        # internal format: top0 bot0 top1 bot1 top2 bot2 top3 bot3
        # bus format: top3 top2 top1 top0 bot0 bot1 bot2 bot3 bot4
        outtop = []
        outbot = []
        bs = self._bits
        for seg in range(4):
            for col in range(Segment.COLS):
                a = Column.BITS * (seg * Segment.COLS + col)
                b = a + Column.TOPBITS
                c = b + Column.BOTBITS
                # upper row's *columns* are in reverse order, the bits inside them are normally
                # flip here and again the whole row afterwards -> ok
                outtop += bs[a:b][::-1]
                outbot += bs[b:c]
        return outtop[::-1] + outbot

    def __repr__(self):
        return "Screen(%d)" % self._size

class Pgdraw(object):
    """Pygame drawer abstraction for the metro screen lib"""
    def __init__(self, squaresize, surface):
        self._square = float(squaresize)
        self._surface = surface

    def map_to(self, physpoint):
        """to pixels"""
        return (int(physpoint[0] * self._square + 0.5),
                int(physpoint[1] * self._square + 0.5))
    def map_from(self, pixpoint):
        """To "physical" coordinates"""
        return (pixpoint[0] / self._square, pixpoint[1] / self._square)

    def polygon(self, points, color):
        pygame.gfxdraw.polygon(self._surface,
                map(self.map_to, points), color)

    def filled_polygon(self, points, color):
        pygame.gfxdraw.filled_polygon(self._surface,
                map(self.map_to, points), color)
