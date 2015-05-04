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
	subl
}

wicky () {
	echo "wacky"
}

chrome () {
	daemon -- google-chrome-stable --touch-devices=123 $@
}

firefox () {
	daemon -- firefox $@
}
