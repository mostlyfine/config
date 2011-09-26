syntax on
filetype on
filetype indent on
filetype plugin on
colorscheme desert

set nocompatible
set laststatus=2
set cmdheight=2
set statusline=[%L]\ %t%r%m%=\ [%{&ff}]\ %{'['.(&fenc!=''?&fenc:&enc).']'}\ %c:%l
set autoread
set hidden
set backspace=indent,eol,start
set confirm
set vb t_vb=

set showcmd
set showmatch
set number
set display=uhex
set nolist
set noruler
set formatoptions+=mM
set shellslash

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,mac,dos
set ambiwidth=double

set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

set wildmenu
set wildmode=full
set complete+=k

imap <C-j> <Esc>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap j gk

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

nnoremap + 3<C-w>+
nnoremap - 3<C-w>-
nnoremap { 3<C-w><
nnoremap } 3<C-w>>

nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap <Space> :bnext<CR>
nnoremap <S-Space> :bprevious<CR>
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>

autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal filetype=git
autocmd BufNewFile,BufNew,BufRead *.changelog,changelog setlocal filetype=changelog
autocmd InsertEnter * highlight StatusLine ctermbg=red guibg=red
autocmd InsertLeave * highlight StatusLine ctermbg=darkgray guibg=darkgray
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickFixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin
scriptencoding utf-8
highlight IgnoreSpace ctermbg=red guibg=red
autocmd Colorscheme * highlight IgnoreSpace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match IgnoreSpace /\s\+$\|　/

set formatoptions-=r
set formatoptions-=o
set errorformat=%m\ in\ %f\ on\ line\ %l

" perl
autocmd BufNewFile,BufNew,BufRead *.tt,*.cfm setlocal filetype=html
autocmd BufNewFile,BufNew,BufRead *.pl,*.pm,*.t,*.cgi,*.psgi setlocal filetype=perl
let perl_no_scope_in_variables=1
let perl_include_pod=1
let perl_extended_vars=1
let perl_perl_sync_dist=250

" ruby
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.feature,*.rhtml,*.haml setlocal filetype=ruby
autocmd BufNewFile,BufRead *.rb,*.rhtml,*.haml setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.rb,*.rhtml,*.haml setlocal softtabstop=2
