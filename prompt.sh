PROMPT_COMMAND=__prompt_command
__prompt_command() {
	local EXIT="$?"
	
	local Cnorm='\[\e[0;37m\]'
	local Chost='\[\e[4;37m\]'
	local Cpath='\[\e[4;32m\]'
	local Cgit='\[\e[4;31m\]'
	local Ctime='\[\e[4;36m\]'
	local Clang='\[\e[4;91m\]'
	local Cexit='\[\e[4;35m\]'
	
	PS1="${Cnorm}┬─╢"

	PS1+="${Chost} \h ${Cnorm}|"
	PS1+="${Cpath} \w ${Cnorm}|"
	PS1+="$(__git_ps1 "${Cgit} %s ${Cnorm}|")"
	PS1+="${Ctime} \@ ${Cnorm}|"

	# languages
	if [ -x "$(command -v ruby)" ]; then
		PS1+="${Clang} Ruby: $(ruby -e "puts RUBY_VERSION") ${Cnorm}|"
	fi

	if [ -x "$(command -v node)" ]; then
		PS1+="${Clang} Node: $(node -e "console.log(process.version)") ${Cnorm}|"
	fi
	
	PS1+="${Cexit} ${EXIT} ${Cnorm}"
	
	PS1+="${Cnorm}╟──\n╰─\$ "
}