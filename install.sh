#!/bin/bash

home=$PWD

# CREATE TEMP DIRECTORY FOR DEB PACKAGES
mkdir "temp"
cd temp

# DOWNLOAD AND INSTALL VSCODE
wget -O ./vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo apt install ./vscode.deb
rm ./vscode.deb

# DOWNLOAD AND INSTALL CHROME
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb
rm ./google-chrome*.deb

# INSTALL CEREBRO
wget https://github.com/lmenezes/cerebro/releases/download/v0.8.4/cerebro_0.8.4_all.deb
sudo apt install ./cerebro_0.8.4_all.deb
rm ./cerebro_0.8.4_all.deb

# INSTALL NVM (NODE)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
nvm install 8.16.0

# REMOVE TEMP DIR
cd ../
rm -r ./temp

# INSTALL AND CONFIGURE GIT
sudo apt-get install git
git config --global user.name "David Andrews"
git config --global user.email "dandrewsuk82@gmail.com"

# INSTALL GUAKE
sudo apt-get install guake

# INSTALL GIMP
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update
sudo apt-get install gimp

# INSTALL INKSCAPE
sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo apt-get update
sudo apt-get -y install inkscape

# INSTALL SYNERGY
sudo apt install synergy

# INSTALL VLC
sudo snap install vlc

# INSTALL REDSHIFT
sudo apt-get install redshift

# INSTALL XSCREENSAVER
sudo apt-get install xscreensaver

# INSTALL GOOGLE FONTS
git clone https://github.com/google/fonts.git ~/temp_google
mkdir ~/.fonts
cd ~/temp_google/ofl
for d in */
do
    for f in $d
    do
        cd $f
        for i in ./*
        do
            if [[ $i == *.ttf ]]
            then
                cp $i ~/.fonts
            fi
        done
        cd ../
    done
done
cd ~/
sudo rm -r ~/temp_google/

# COPY AUTOSTART FILE
cd $home
cp ./autostart ~/.config