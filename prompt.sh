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
	local Clang='\[\e[4;91m\]'
	local Cexit='\[\e[4;35m\]'
	
	PS1="${Cnorm}┬─┤"

	# Hostname
	PS1+="${Chost} \h ${Cnorm}|"

	# Working directory
	PS1+="${Cpath} \w ${Cnorm}|"

	# Git Info
	PS1+="$(__git_ps1 "${Cgit} %s ${Cnorm}|")"
	PS1+="${Ctime} \@ ${Cnorm}|"

	# Languages
	if [ "$PROMPT_SHOW_LANGS" = true ]; then
		# languages
		if [ -x "$(command -v ruby)" ]; then
			PS1+="${Clang} Ruby:$(ruby -e "puts RUBY_VERSION") ${Cnorm}│"
		fi

		if [ -x "$(command -v node)" ]; then
			PS1+="${Clang} Node:$(node -e "console.log(process.version)") ${Cnorm}│"
		fi
	fi

	# Time
	PS1+="${Ctime} \@ ${Cnorm}|"

	# Exit code, and prompt
	PS1+="${Cnorm}├──\n╰╴${EXIT}╶╴\$ "
}

PROMPT_COMMAND=__prompt_command

if [ ! -f ~/.bash/.prompt-langs ]; then
	prompt-langs
fi
