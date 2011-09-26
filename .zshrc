autoload -U compinit
bindkey -e
compinit

if [ $(uname -p | wc -c) -le $(uname -m | wc -c) ]; then
  PROCESSOR=$(uname -p);
else
  PROCESSOR=$(uname -m);
fi
KERNEL=$(uname -s | tr "[A-Z]" "[a-z]")

export LANG=ja_JP.UTF-8
export EDITOR=/usr/bin/vi
export CTAGS="--langmap=RUBY:.rb.yml -R"
export PATH=$PATH:$HOME/local/bin

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep
setopt magic_equal_subst
setopt extended_history
setopt share_history
setopt hist_ignore_dups

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

PROMPT="%% "
RPROMPT="[%/]"
PROMPT2="%_%%"
SPROMPT="%r is corrent? [n,y,a,e]: "

case "${TERM}" in
    kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

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
        alias ls="ls --color=auto"
        ;;
    darwin*)
        alias ls="ls -G"
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

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload history-search-end

#function history-all { history -E 1}
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey '^P' history-beginning-search-backword
#bindkey '^N' history-beginning-search-backword


zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ''

# Ruby
export GEM_HOME=$HOME/.gem/ruby/1.8 #/var/lib/gems/1.8
export PATH=$PATH:$GEM_HOME/bin
export RUBYOPT=rubygems
export RSPEC=true

# perl
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"
export PERM_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PATH=$PATH:$HOME/extlib/bin

# alias
alias v="vi"
alias where="command -v"
alias j="jobs -l"
alias ll="ls -lh"
alias lv="lv -c"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vc="vim ~/changelog"
alias g="git"
alias r="rails"
if [ -e `which colordiff` ]; then
  alias diff="colordiff"
fi

## for rails
alias sc="./script/console -s"
alias ss="./script/server"
alias sg="./script/generate"
