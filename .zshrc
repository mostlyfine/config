
autoload -U compinit
compinit

export LANG=ja_JP.UTF-8
export EDITOR=/usr/bin/vi
export CTAGS="--langmap=RUBY:.rb.yml -R"
export PATH=$PATH:$HOME/bin
# プロンプトの設定
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

# ターミナルのタイトル
case "${TERM}" in
    kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# カラー表示
autoload colors
case "${TERM}" in
    kterm*|xterm*)
        export LSCOLORS=exfxcxdxbxegedabagacad
        export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
        ;;
    cons25)
        unset LANG
        export LSCOLORS=ExFxCxdxBxegedabagacad
        export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
        ;;
esac

case "${OSTYPE}" in
    linux*)
        export GIT_PAGER='less -RE'
        ;;
esac

# ディレクトリ名でcd
setopt auto_cd

# 移動したディレクトリを記録
setopt auto_pushd

# コマンド入力ミス補正
setopt correct

# 補完候補をつめて表示
setopt list_packed

# 補完時にビープ音をならさない
setopt nolistbeep

# 履歴
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

# 補完候補をカーソル選択
zstyle ':completion:*:default' menu select=1

# 補完候補をカラー表示
zstyle ':completion:*' list-colors ''

# Ruby
export GEM_HOME=/var/lib/gems/1.8
export PATH=$PATH:$GEM_HOME/bin:~/.gem/ruby/1.8/bin
export RUBYOPT=rubygems

# alias
alias v="vi"
alias where="command -v"
alias j="jobs -l"
alias ls="ls --color"
alias ll="ls -l"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vc="vim ~/changelog"
alias g="git"

## for rails
alias sc="./script/console -s"
alias ss="./script/server"
alias sg="./script/generate"

