# .bashrc
LANG=ja_JP.UTF-8

umask 022     # 新規作成ファイルのパーミッション644
ulimit -c 0   # coreファイル作成できないように

export PAGER=/usr/bin/lv
export EDITOR=/usr/bin/vim
export PERLDOC_PAGER=/usr/bin/lv

complete -d cd
complete -c man
complete -c wi
complete -v unset

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ssh auto passphase input
if [ -z "`ps -u $USER | grep ssh-agent`" ]; then
  ssh-agent > ~/.ssh/env
fi

if [ -f ~/.ssh/env ]; then
  source ~/.ssh/env > /dev/null
fi

# User specific aliases and functions
alias ls="ls --color=auto -h"
alias ll="ls -ltah"
if [ -f /usr/bin/lv ]; then
  alias lv="vi -R"
else
  alias lv="lv -c"
fi
alias g="git"
alias grep="grep --color"
alias du="du -h"
alias dh="dh -h"
alias diff="colordiff"

# ruby
export GEM_HOME=$HOME/.gem/ruby/1.9.1 #/var/lib/gems/1.9
export PATH=$PATH:$GEM_HOME/bin
export RUBYOPT=rubygems
export RSPEC=true

# perl
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$PATH:$HOME/perl5/bin
export PERL5LIB=$PERL5LIB:$HOME/perl5/lib/perl5

