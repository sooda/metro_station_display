#!/bin/bash
# kokonaisen näytöllisen skrollailu, pikapurkka kuten näkyy
# skrollaa niin nopeasti, että jatkuvasta tekstistä ei ota selvää
# datan esirendaaminen kestää hetken
msg='hello world abcdefghijklmnopqrstuvwxyz ABCDEFGH '
msg=':D       Hello world            :D              '
maxlen=48; msg=${msg:0:$maxlen}; echo "'$msg'" 1>&2; a="$msg$msg"; for i in `seq 1 ${#msg}`; do s=${a:$i:${#msg}}; ../fontdecode.py ../program.bin 10 "$s" 2>/dev/null|xargs|sed 's/ //g'; echo $i/$maxlen 1>&2; done > buf
a=true; while $a; do cat buf | ./transmit_whole.py /dev/ttyACM0 || a=false ; done
