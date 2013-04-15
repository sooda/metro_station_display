Metrografiikkakirjasto ja piirto-ohjelma pythonilla
===================================================

Tässä toivottavasti yleiskäyttöinen pikkukirjasto grafiikkabittien kanssa työskentelyyn. Ohessa myös demosofta bittien piirtämiseen; toimii ainakin printline_decoder.py:n kanssa oivasti. Välilyönti tulostaa sille syötettävää tekstiä. Jos putkitat niin lopeta tämä ohjelma ensin jotta decoderin stdin sulkeutuu.

Piirtäminen tapahtuu hiirellä klikkailemalla; keskinappi togglaa yksittäisbittimoodin ja isomman pyöreän pensselin välillä.

Komentoriviparametrina annetaan myös yksi kuvatiedosto, josta luetaan pikselien väriarvoja ja katsotaan, voisiko niistä subsamplata metronäyttöpikseleitä. Metropikselien polygonit käydään läpi, ja jos yli 50% polygonin alasta sisältää kuvapisteitä joilla ainakin yksi rgb-värikanavista on >127, polygonia vastaava bitti menee päälle. Kokeile vaikka printline_decoderin luomalla metroscreen.png:llä jonka voi taas luoda fontdecodella.

Kuvatiedoston importtaus on hitaahkoa tällä pythontoteutuksella. Voisi tehdä C:llä paremman, niin saisi rendattua näytölle vaikka videota.
