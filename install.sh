#!/bin/bash
source ./update.sh

sed -i -e '$a\' ~/.bashrc
echo "source ~/.profile" >> ~/.bashrc

git config --global user.name "Stephen A. Wilson"
git config --global user.email "Stephen-356@hotmail.com"
git config --global core.editor subl
git config --global push.default simple