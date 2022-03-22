# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt nomatch sharehistory histbeep
unsetopt autocd extendedglob
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/loan/.zshrc'

# Completion tab
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Arrow history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Starship
eval "$(starship init zsh)"

# Add in history only if valid
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# import shared aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# word navigation
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
# bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word 

# yaal packages specific
export PIP_YAAL_USER="www-data"
export PIP_YAAL_PASSWORD="apachepip"
export DEVPI_YAAL_USER="yaal"
export DEVPI_YAAL_PASSWORD="yaal"
source /etc/zsh_command_not_found

export PATH=$PATH:/home/loan/.cargo/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
