#!/bin/sh

echo Install rpitx - some package need internet connection -

cd src || exit
git clone https://github.com/F5OEO/librpitx
cd librpitx/src || exit
make && sudo make install
cd ../../ || exit

make
sudo make install
cd .. || exit

printf "\n\n"
printf "In order to run properly, rpitx need to modify /boot/config.txt. Are you sure (y/n) "
read -r CONT

if [ "$CONT" = "y" ]; then
  echo "Set GPU to 250Mhz in order to be stable"
   LINE='gpu_freq=250'
   FILE='/boot/config.txt'
   grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE"
   #PI4
   LINE='force_turbo=1'
   grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE"
   echo "Installation completed !"
else
  echo "Warning : Rpitx should be instable and stop from transmitting !";
fi

