# Based on gnzh theme

setopt prompt_subst

pyenv_prompt_info () {
  local version="$(pyenv version-name)"
  echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}${version:gs/%/%%}${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}

() {
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{yellow}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi

local os_name="$(grep -E '^NAME=' /etc/os-release | sed -En 's/NAME=\"(.*)\"/\1/p')"
local return_code="%(?..%F{red}‹%? ↵›%f)"
local user_host="${PR_USER}%F{cyan}@${PR_HOST} [${os_name}]"
local current_dir="%B%F{blue}%~%f%b"

ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

ZSH_THEME_NVM_PROMPT_PREFIX="%F{green}‹"
ZSH_THEME_NVM_PROMPT_SUFFIX="›%f"

ZSH_THEME_PYENV_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_PYENV_PROMPT_SUFFIX="›%f"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{cyan}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%f"

PROMPT="╭─${user_host} ${current_dir} \$(ruby_prompt_info) \$(nvm_prompt_info) \$(pyenv_prompt_info) \$(git_prompt_info) ${return_code}
╰─$PR_PROMPT "
}
