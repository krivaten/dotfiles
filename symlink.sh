#!/bin/bash

sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.psqlrc

ln -s ~/dotfilez/vimrc ~/.vimrc
ln -s ~/dotfilez/tmux ~/.tmux
ln -s ~/dotfilez/tmux.conf ~/.tmux.conf
ln -s ~/dotfilez/psqlrc ~/.psqlrc
ln -s ~/dotfilez/tigrc ~/.tigrc


echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"
