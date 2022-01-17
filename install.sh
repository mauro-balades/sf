#!/bin/bash

echo "cloning..."
git clone -b code-beauty https://github.com/mauro-balades/sf.git

echo "changin current directory"
cd sf

echo "coping shell file to /bin/ (using sudo)..."
sudo cp sf /bin/sf

echo "coping sf configuration's file..."
cp "./config.example.sh" "~/.config/sf/config.sh"

echo "cleaning..."
cd ..
sudo rm -rf sf

echo "FINISHED!"
