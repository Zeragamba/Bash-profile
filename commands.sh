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
}

cdls () {
	cd $1 && ls
}
