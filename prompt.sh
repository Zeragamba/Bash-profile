PROMPT_COMMAND=__prompt_command
__prompt_command() {
	local EXIT="$?"
	PS1=""

	local Cnorm='\[\e[0;37m\]'
	local Chost='\[\e[4;37m\]'
	local Cpath='\[\e[4;32m\]'
	local Cgit='\[\e[4;31m\]'
	local Ctime='\[\e[4;36m\]'
	local Cexit='\[\e[4;35m\]'
	
	PS1+="${Cnorm}┬─╢"

	PS1+="${Chost} \h ${Cnorm}|"
	PS1+="${Cpath} \w ${Cnorm}|"
	PS1+="$(__git_ps1 "${Cgit} %s ${Cnorm}|")"
	PS1+="${Ctime} \@ ${Cnorm}|"
	PS1+="${Cexit} ${EXIT} ${Cnorm}"
	
	PS1+="${Cnorm}╟──\n╰─\$ "
}
