#export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH="$PATH:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin"
PATH=$PATH:~/bin
export PATH

#lsの色変更
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1

#export PATH
source .bashrc

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
