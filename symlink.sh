#!/bin/bash

sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.ackrc > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.psqlrc

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ackrc ~/.ackrc
ln -s ~/dotfiles/tmux ~/.tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/psqlrc ~/.psqlrc
ln -s ~/dotfiles/tigrc ~/.tigrc
sudo ln -s ~/dotfiles/sysctl.conf /etc/sysctl.conf


echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"
