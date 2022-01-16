#!/bin/bash

git clone https://github.com/mauro-balades/sf.git

cd sf
sudo cp sf /bin/sf
alias smf="sf"
cd ..
sudo rm -rf sf
