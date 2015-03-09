cdls () {
    cd $@
    echo "== $PWD:"
    ls
}

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
	git pull
}

subl-update () {
	cd ~/.config/sublime-text-3/Packages/User
	git pull
}

wicky () {
	echo "wacky"
}

chrome () {
	daemon google-chrome $@
}

firefox () {
	daemon firefox $@
}
