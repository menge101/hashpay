#!/usr/bin/bash

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install libindicator7
sudo apt-get install libappindicator1
sudo dpkg -i google-chrome-stable_current_amd64.deb