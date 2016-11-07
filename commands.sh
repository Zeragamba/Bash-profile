dev () {
	if [ $# -gt 0 ];
	then
		cd ~/dev/$1
	else
		cd ~/dev
	fi
}

home () {
	cd ~
}

bash-update () {
	cd ~/.bash
	git pull --rebase
	source ~/.bash_profile
}

subl-update () {
	cd ~/.config/sublime-text-3/Packages/User
	git pull --rebase
	subl
}

wicky () {
	echo "wacky"
}


cdls () {
	cd $1 && ls
}
