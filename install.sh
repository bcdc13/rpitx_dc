#!/bin/sh

cd src || exit
git clone https://github.com/F5OEO/librpitx
cd librpitx/src || exit
cd ../../ || exit

make
sudo make install
cd .. || exit

LINE='gpu_freq=250'
FILE='/boot/config.txt'
grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE" >/dev/null
#PI4
LINE='force_turbo=1'
grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE" >/dev/null
