#!/bin/zsh
select tool in "theHarvester" "Maltego CE" "Recon-ng" "Spiderfoot" "Skiptracer" "Sherlock" "Photon" "Osmedeus" "Ghunt" "Infoga" "Exit"; do
case $tool in
"theHarvester") theharvester;;
"Maltego CE") maltego;;
"Recon-ng") recon-ng;;
"Spiderfoot") spiderfoot;;
"Skiptracer") skiptracer;;
"Sherlock") sherlock;;
"Photon") photon;;
"Osmedeus") osmedeus;;
"Ghunt") ghunt;;
"Infoga") infoga;;
"Exit") break;;
*) echo "Invalid option. Please select a valid tool.";;
esac
done
