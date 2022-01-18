#!/bin/bash
# This script assumes the following:
# - you have root access to the linux box you are trying to set up.
# - the OS is Ubuntu 16.04+ or higher.
# - the Snap package manager is already installed.
# - <others>

# Tanmoy Sanyal

# bashrc
cp bashrc $HOME/.bashrc

# set path for downloading softwares
SOFTWARE_DOWNLOAD_PATH=$HOME/mysoftware
mkdir -p $SOFTWARE_DOWNLOAD_PATH

# miniconda
MINICONDA_SRC_PATH=$SOFTWARE_DOWNLOAD_PATH/Miniconda3-latest-MacOSX-x86_64.sh
MINICONDA_INSTALL_PATH=$HOME/miniconda3
curl -o $MINICONDA_SRC_PATH https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash $MINICONDA_SRC_PATH -b -p $MINICONDA_INSTALL_PATH
echo -e "#conda\nsource $MINICONDA_INSTALL_PATH/etc/profile.d/conda.sh" >> $HOME/.bashrc
echo "conda activate" >> $HOME/.bashrc
source $HOME/.bashrc

# git
sudo apt install git 

# git config
git config --global user.name "tanmoy7989"
git config --global user.email "tanmoy.7989@gmail.com"

# github authorization: config
echo """
Host github.com-tanmoy7989
    Hostname github.com
    User git
     IdentityFile $HOME/.ssh/id_rsa
""" >> $HOME/.ssh/config

# github authorization: key exchange
ssh-keygen -t rsa -b 4096 -q -f $HOME/.ssh/id_rsa -N ""
cat $HOME/.ssh/id_rsa.pub
echo -e "\nCopy this key over to Github using https://github.com/settings.ssh/new"
echo "Press any key to continue"
read

# vim
sudo apt install vim

mkdir -p $HOME/.vim/bundle
git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp vimrc $HOME/.vim/vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall

# python scientific stack
conda env create --file scienv.yml

# personal website (and web dev stack)
# git clone git@github.com:tanmoy7989/tanmoy7989.github.io.git $HOME/my_website
# CURR_DIR=$(pwd)
# cd $HOME/my_website && bash setup.sh
# cd $CURR_DIR

# clear conda cache
conda clean -y -t

# sshfs
sudo apt install sshfs

# latex
echo -e "\nInstalling latex... (please be patient)"
sudo apt install texlive-latex-extra
sudo apt install texmaker

# brave browser (privacy and anti-tracking out-of-the-box)
# instructions at: https://brave-browser.readthedocs.io/en/latest/installing-brave.html
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
chmod +x zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
rm zoom_amd64.deb

# slack
sudo snap install slack --classic

# vscode (TODO: test this)
# sudo snap install vscode

echo "If you this is a new linux box, exit this script (Ctrl + z) and also download the following using the given links:"
echo "Install Microsoft teams from: https://www.microsoft.com/en-us/microsoft-teams/download-app"
read

# privacy (prevent Canonical from snooping in on you)
# source: https://securitronlinux.com/ubuntu-2/how-to-help-stop-ubuntu-spying-on-you/
ubuntu-report -f send no
sudo apt purge popularity-contest whoopsie
sudo vim /etc/default/motd-news # set ENABLED=0 in this file
gsettings set com.ubuntu.geoip geoip-url ""

# refresh
sudo apt upgrade && sudo apt update
sudo apt autoremove
sudo apt autoclean
sudo reboot now
