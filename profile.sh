if [ -z "$ZSH" ]; then
  source ~/.bash/git-prompt.sh
  source ~/.bash/prompt.sh
else
  source ~/.bash/zsh.sh
fi

source ~/.bash/commands.sh
source ~/.bash/aliases.sh

source ~/.bash/rbenv.sh
source ~/.bash/nvm.sh