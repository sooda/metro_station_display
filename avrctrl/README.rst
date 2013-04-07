Ohjauskoodia teensylle, grafiikkaa usbin yli
============================================

Miniframeworkki/-kirjasto/whatever C:llä teensylle ohjaamaan väylää, sekä pc:n
puolelle python-sotkua syöttämään sitä graffaa teensylle usbista.

LCD-frameworkista on kaksi versiota: yksi streamaa suoraan väylälle sitä mukaa
kun tavuja tulee, ja toinen nykii graffat framebufferiin, joka työnnetään
väylälle kokonaisena myöhemmin. Streamaus ei vaadi juurikaan ram-tilaa,
framebuffer taas on 276 tavua (per neljän segmentin rivi). Framebufferia täytyy
käyttää, jos graffaa piirretään täysin mikrokontrollerin puolella (tai ei ole
pakko, mutta se helpottaa elämää).

Pääohjelmat mikrokontrollerille (ctrlascii.c ja ctrlbinary.c) lukevat
stdin/stdoutiksi konffattua sarjaporttia (tässä teensyn hardiksella toimiva
virtuaalisarjaportti usbin yli, pohjautuu PJRC:n esimerkkikoodiin_
(usb_serial.[ch]), sieltä myös avr-makefilet, kääntyy ainakin arduinon mukana
tulevalla avr-gcc:llä kun pjrc sitä suosittelee) ja syöttävät luetut bitit
sellaisenaan näytölle. Lähetetyt tavut kaiutetaan takaisin
debuggaustarkoituksessa.

.. _esimerkkikoodiin: http://www.pjrc.com/teensy/usb_serial.html

Kaksi eri versiota lukevat asciita ja binääriä, ensimmäinen syö suoraan samaa
alkuperäisdumpeista grepattua asciibittidataa kuin muutkin työkalut (esim.
printline_decoder.py) ja jälkimmäiselle syötetään bitit binäärimuodossa, eli se
on ainakin teoriassa noin kahdeksan kertaa vikkelämpi.

Koodia voi käyttää avr:n lisäksi myös linuxilla emuloimaan väylää, tulosteet
ovat samankaltaisia kuin 8085-emulaattorikaappauksissa. Niitä vertailemalla voi
verifioida koodin oikeellisuuden.

PC-puolen ohjauskoodit ovat pythonia (transmit.py asciiversiolle,
transmit_whole.py binääriversiolle) ja niille syötetään bitit taas samassa
muodossa.

Yläpuoliskon tekstit varastoidaan framebufferissakin vielä toistaiseksi suoraan
lcd-järjestyksessä, eli lopusta alkuun; tälle kannattanee tehdä myöhemmin
jotain, että olisi helpompi ohjata pikseleitä käsin. Nyt tuolle on vain helppoa
antaa alkuperäistekstiä.
