prompt-langs() {
	if [ ! -z "$1" ] && [ $1 = off ]; then
		echo 'false' > ~/.bash/.prompt-langs
	else
		echo 'true' > ~/.bash/.prompt-langs
	fi

	PROMPT_SHOW_LANGS=$(cat ~/.bash/.prompt-langs)
}

__prompt_command() {
	local EXIT="$?"

	local Cnorm='\[\e[0;37m\]'
	local Chost='\[\e[4;37m\]'
	local Cpath='\[\e[4;32m\]'
	local Cgit='\[\e[4;31m\]'
	local Ctime='\[\e[4;36m\]'
	local Clang='\[\e[4;37m\]'
	local Cexit='\[\e[4;35m\]'

	PS1="${Cnorm}┬─┤"

	# Hostname
	PS1+="${Chost} \h ${Cnorm}│"

	# Working directory
	PS1+="${Cpath} \w ${Cnorm}│"

	# Git Info
	PS1+="$(__git_ps1 "${Cgit} %s ${Cnorm}│")"

	# Time
	PS1+="${Ctime} $(date +"%H:%M") ${Cnorm}│"

	# Exit Code
	PS1+="${Cexit} ${EXIT} ${Cnorm}"

	#end line
	PS1+="${Cnorm}├──\n"
	# Languages

	if [ "$PROMPT_SHOW_LANGS" = true ]; then
		PS1+="│ ├╴Ruby:   "
		if [ -x "$(command -v ruby)" ]; then
			PS1+="$(ruby -e "puts RUBY_VERSION")"
		else
			PS1+="-"
		fi
		PS1+="\n"

		PS1+="│ ├╴Node:   "
		if [ -x "$(command -v node)" ]; then
			PS1+="$(node -e "console.log(process.version)")"
		else
			PS1+="-"
		fi
		PS1+="\n"

		PS1+="│ └╴Python: "
		if [ -x "$(command -v node)" ]; then
			PS1+="$(python -c "import platform; print(platform.python_version())")"
		else
			PS1+="-"
		fi
		PS1+="\n"
	fi

	# Exit code, and prompt
	PS1+="╰╴\$ "
}

GIT_PS1_SHOWDIRTYSTATE=true
PROMPT_COMMAND=__prompt_command

if [ ! -f ~/.bash/.prompt-langs ]; then
	prompt-langs off
fi
