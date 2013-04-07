Metron vanhojen laiturinäyttöjen ohjaus
=======================================

Reverse-engineerattua tavaraa ja uutta ohjauskoodia HSL:n vanhoille oransseille metroasemien laiturinäytöille. Näytön ohjausboksi on tietokone 8085-prosessorilla ja LCD-paneelit syövät bittejä. Katso blogauksiani_ aiheesta.

.. _blogauksiani: http://sooda.dy.fi/tag/metrolaiturinäytöt/

* metro.py puhuu sarjaporttiin komentoja, joihin originaalisoftan pitäisi vastata.
* fontdecode.py lukee ohjelmamuistin (program.bin) lopussa olevia fonttikarttoja.
* printline.c on teensy++ 2.0:lla testattu palikka oksentamaan pikselidataa lcd-väylille. Toimii ainakin tökkäämällä nastat 8155-piirin tilalle sopiviin nastoihin.
* printline_to_header.py käpistelee bittejä printline.c:tä varten.
* printline_decoder.py emuloi näyttöä, vaatii pygamen.
* avrctrl/: softaa syöttämään grafiikkaa teensyn virtuaalisarjaportin yli suoraan lcd-väylälle.

Yleishyödyllistä kivaa:

* http://www.hobbyprojects.com/microprocessor_tutorials/8085_mnemonics_opcode_instructions.html
* http://www.cpu-world.com/Arch/8085.html
* http://pythagoras.physics.upatras.gr/~gmanol/download.htm
