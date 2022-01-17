#!/bin/bash

echo "cloning..."
git clone -b code-beauty https://github.com/mauro-balades/sf.git

echo "changin current directory"
cd sf

echo "coping shell file to /bin/ (using sudo)..."
sudo cp sf /bin/sf

echo "creating config folder..."
mkdir -p "~/.config/sf/"

echo "coping sf configuration's file (using sudo)..."
sudo cp -f "./example/config.sh" "~/.config/sf/"

echo "cleaning..."
cd ..
sudo rm -rf sf

echo "FINISHED!"
