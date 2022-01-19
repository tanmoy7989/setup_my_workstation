#!/bin/bash
# This script assumes the following:
# - you have root access to the macbook you are trying to set up.
# - the OS version is Big Sur or higher.
# - <others>

# Tanmoy Sanyal

# bashrc
cp bashrc $HOME/.bashrc_macos
# hide pesky zsh message (zsh is now the default shell, but long time bash # user here)
echo "export BASH_SILENCE_DEPRECATION_WARNING=1" >> $HOME/.bash_profile

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

# git (through command-line tools)
xcode-select --install

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
echo -e "\nCopy this key over to Github using https://github.com/settings/ssh/new"
echo "Press any key to continue"
read

# vim
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

echo "If you this is a new macbook, also download the following using the given links:"
echo "Install Brave browser from: https://brave.com/download/"
echo "Install Zoom from : https://zoom.us/download"
echo "Install Microsoft teams from: https://www.microsoft.com/en-us/microsoft-teams/download-app"
echo "Install Slack from: https://apps.apple.com/app/slack/id803453959"
echo "Install VSCode from: https://code.visualstudio.com/docs?dv=osx"
echo "Install iterm from https://iterm2.com/downloads.html"

