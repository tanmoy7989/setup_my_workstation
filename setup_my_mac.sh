#!/bin/bash
# This script assumes the following:
# - you have root access to the macbook you are trying to set up.
# - the OS version is Big Sur or higher.

# Tanmoy Sanyal

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# bashrc
cp bashrc $HOME/.bashrc_macos
# hide pesky zsh message (zsh is now the default shell, but long time bash # user here)
echo "export BASH_SILENCE_DEPRECATION_WARNING=1" >> $HOME/.bash_profile

# set path for downloading softwares
SOFTW_PATH=$HOME/mysoftware
mkdir -p $SOFTW_PATH

# download miniconda
MINICONDA_SRC_PATH=$SOFTW_PATH/Miniconda3-latest-MacOSX-x86_64.sh
MINICONDA_INSTALL_PATH=$HOME/miniconda3
curl -o $MINICONDA_SRC_PATH https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash $MINICONDA_SRC_PATH -b -p $MINICONDA_INSTALL_PATH

# add miniconda to the shell
source $MINICONDA_INSTALL_PATH/bin/activate
conda init zsh

# install mamba and add to shell
conda install -c conda-forge mamba
mamba init zsh

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

# clear conda cache
conda clean -y -t

echo "If you this is a new macbook, also download the following using the given links:"
echo "Install Brave browser from: https://brave.com/download/"
echo "Install Zoom from : https://zoom.us/download"
echo "Install Microsoft teams from: https://www.microsoft.com/en-us/microsoft-teams/download-app"
echo "Install Slack from: https://apps.apple.com/app/slack/id803453959"
echo "Install VSCode from: https://code.visualstudio.com/docs?dv=osx"
echo "Install iterm from https://iterm2.com/downloads.html"

