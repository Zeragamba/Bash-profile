if [ -d "$HOME/.nvm" ]
then
  export NVM_DIR="$HOME/.nvm"
  NVM_AUTOLOAD=1 # Allow ZSH plugin to auto load the right version of node
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
