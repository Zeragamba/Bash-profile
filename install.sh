#!/bin/bash
sed -i -e '$a\' ~/.bashrc
echo "source ~/.bash/profile.sh" >> ~/.bashrc

git config --global user.name "Stephen A. Wilson"
git config --global user.email "Stephen-356@hotmail.com"
git config --global push.default simple
