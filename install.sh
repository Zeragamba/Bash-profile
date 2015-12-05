#!/bin/bash
sed -i -e '$a\' ~/.bashrc
echo "source ~/.bash/.profile" >> ~/.bashrc

git config --global user.name "Stephen A. Wilson"
git config --global user.email "Stephen-356@hotmail.com"
git config --global core.editor "subl -n -w"
git config --global push.default simple

mkdir ~/dev
