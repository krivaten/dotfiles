#!/bin/bash

sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.ackrc > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.psqlrc

ln -s ~/dotfilez/vimrc ~/.vimrc
ln -s ~/dotfilez/ackrc ~/.ackrc
ln -s ~/dotfilez/tmux ~/.tmux
ln -s ~/dotfilez/tmux.conf ~/.tmux.conf
ln -s ~/dotfilez/zshrc ~/.zshrc
ln -s ~/dotfilez/psqlrc ~/.psqlrc
ln -s ~/dotfilez/tigrc ~/.tigrc
sudo ln -s ~/dotfilez/sysctl.conf /etc/sysctl.conf


echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"
