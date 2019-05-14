#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jfunke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
autoload -U promptinit; promptinit
prompt pure
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export FZF_DEFAULT_COMMAND="fd --type f"
