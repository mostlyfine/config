
autoload -U compinit
compinit

export LANG=ja_JP.UTF-8
export EDITOR=/usr/bin/vi
export CTAGS="--langmap=RUBY:.rb.yml -R"
export PATH=$PATH:$HOME/local/bin
# $B%W%m%s%W%H$N@_Dj(B
PROMPT="%% "
RPROMPT="[%/]"
PROMPT2="%_%%"
SPROMPT="%r is corrent? [n,y,a,e]: "

#case ${UID} in
#0)
#    PROMPT="%B%{31m%]]}%/#%{[m%]]}%b "
#    PROMPT2="%B%{^[[31m%]]}%_#%{^[[m%]]}%b "
#    SPROMPT="%B%{^[[31m%]]}%r is correct? [n,y,a,e]:%{^[[m%]]}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    PROMPT="%{^[[37m%]]}${HOST%%.*} ${PROMPT}"
#    ;;
#*)
#    PROMPT="%{^[[31m%]]}%/%%%{^[[m%]]} "
#    PROMPT2="%{^[[31m%]]}%_%%%{^[[m%]]} "
#    SPROMPT="%{^[[31m%]]}%r is correct? [n,y,a,e]:%{^[[m%]]} "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#    PROMPT="%{^[[37m%]]}${HOST%%.*} ${PROMPT}"
#    ;;
#esac 

# $B%?!<%_%J%k$N%?%$%H%k(B
case "${TERM}" in
    kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# $B%+%i!<I=<((B
autoload colors
case "${TERM}" in
    kterm*|xterm*)
        export LSCOLORS=gxfxcxdxbxegedabagacad
        export LS_COLORS='di=32:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
        ;;
    cons25)
        unset LANG
        export LSCOLORS=GxFxCxdxBxegedabagacad
        export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
        ;;
esac

case "${OSTYPE}" in
    linux*)
        export GIT_PAGER='less -RE'
        ;;
esac

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%s:%b'
zstyle ':vcs_info:*' actionformats '%s:%b|%a'
precmd () {
  psvar=()
  vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="[%1(v|%F{green}%1v%f|):%/]"

# $B%G%#%l%/%H%jL>$G(Bcd
setopt auto_cd

# $B0\F0$7$?%G%#%l%/%H%j$r5-O?(B
setopt auto_pushd

# $B%3%^%s%IF~NO%_%9Jd@5(B
setopt correct

# $BJd408uJd$r$D$a$FI=<((B
setopt list_packed

# $BJd40;~$K%S!<%W2;$r$J$i$5$J$$(B
setopt nolistbeep

setopt magic_equal_subst

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# $BMzNr(B
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
autoload history-search-end
#function history-all { history -E 1}
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey '^P' history-beginning-search-backword
#bindkey '^N' history-beginning-search-backword
bindkey -e

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# $BJd408uJd$r%+!<%=%kA*Br(B
zstyle ':completion:*:default' menu select=1

# $BJd408uJd$r%+%i!<I=<((B
zstyle ':completion:*' list-colors ''

# Ruby
export GEM_HOME=$HOME/.gem/ruby/1.8 #/var/lib/gems/1.8
export PATH=$PATH:$GEM_HOME/bin
export RUBYOPT=rubygems
export RSPEC=true

# alias
alias v="vi"
alias where="command -v"
alias j="jobs -l"
alias ls="ls --color"
alias ll="ls -lh"
alias lv="lv -c"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vc="vim ~/changelog"
alias g="git"
alias r="rails"

## for rails
alias sc="./script/console -s"
alias ss="./script/server"
alias sg="./script/generate"

