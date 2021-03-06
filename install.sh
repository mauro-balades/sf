#!/bin/bash

echo "cloning..."
git clone https://github.com/mauro-balades/sf.git

echo "changin current directory"
cd sf

echo "coping shell file to /usr/local/bin/ (using sudo)..."
sudo cp sf /usr/local/bin/sf

echo "creating config folder..."
mkdir -p ~/.config/sf/

echo "coping sf configuration's file..."
cp -f "./example/config.sh" ~/.config/sf/

echo "cleaning..."
cd ..
sudo rm -rf sf

echo "FINISHED!"
