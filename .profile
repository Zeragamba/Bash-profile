source ~/.git-prompt.sh

if [ $(id -u) -eq 0 ];
then
	PS1='\e[0;31m┬─╢\e[4;31m \h \e[0;31m│\e[4;31m \w \e[0;31m$(__git_ps1 "│\e[4;31m %s \e[0;31m")│\e[4;31m \@ \e[0;31m╟──\e[0;37m\n╰─\$ '
else
	PS1='\e[0;37m┬─╢\e[4;37m \h \e[0;37m│\e[4;32m \w \e[4;37m$(__git_ps1 "│\e[4;31m %s \e[4;37m")│\e[4;36m \@ \e[4;37m╟──\e[0;37m\n╰─\$ '
fi

cdls () {
    cd "$@" && ls
}

dev () {
	if [ $# -gt 0 ];
	then
		cd ~/dev/$1
	else
		cd ~/dev
	fi
}

alias cls="clear"

alias gco="git checkout"
alias gst="git status"
alias gpl="git pull"
alias gph="git push"
alias gad="git add"