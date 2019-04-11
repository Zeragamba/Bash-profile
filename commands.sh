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
	source ~/.bashrc
	cd -
}

cdls () {
	cd $1 && ls
}
