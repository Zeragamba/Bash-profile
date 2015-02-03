#!/bin/bash
rm ~/.git-prompt.sh
rm ~/.profile

cp .git-prompt.sh ~/.git-prompt.sh
cp .profile ~/.profile

source ~/.profile