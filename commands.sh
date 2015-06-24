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
	git pull --rebase
}

subl-update () {
	cd ~/.config/sublime-text-3/Packages/User
	git pull --rebase
	subl
}

wicky () {
	echo "wacky"
}

chrome () {
	daemon -- google-chrome-stable $@
}

firefox () {
	daemon -- firefox $@
}

files () {
	if [ -n $(which nemo) ];
	then
		daemo -- nemo "$@"
	else
		deamo -- naut "$@"
	fi;
}
