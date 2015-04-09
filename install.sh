#!/bin/bash
cp ~/.bash/.profile ~/.profile

sed -i -e '$a\' ~/.bashrc
echo "source ~/.profile" >> ~/.bashrc

git config --global user.name "Stephen A. Wilson"
git config --global user.email "Stephen-356@hotmail.com"
git config --global core.editor "subl -n -w"
git config --global push.default simple

mkdir ~/dev
