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

bash-sync () {
	cd ~/.bash
	git add .
	git commit -m "$(hostname) @ $(date +"%Y-%m-%d %R")"
	git pull --rebase
	git push
	source ./profile.sh
	cd -
}

cdls () {
	cd $1 && ls
}
