set nocompatible

" basic -------------------------------------------------------------

" status line
set laststatus=2  " 常にステータスラインを表示
set cmdheight=2  " コマンドラインで利用する行数
set statusline=[%L]\ %t%r%m%=\ %{'['.(&fenc!=''?&fenc:&enc).']'}\ %c:%l

" edit
set autoread                    " 他で書き換えられたら自動で再読み込み
set hidden                      " 編集中でもほかのファイルを開けるようにする
set backspace=indent,eol,start  " バックスペースでインデントや改行を削除
set confirm                     " 変更バッファを保存するか確認

" display
syntax on
set title                       " ウィンドウのタイトルを変更する
set scrolloff=5                 " スクロール時の余白確保
set vb t_vb=                    " ビープを鳴らさない
set showcmd                     " コマンドをステータス行に表示
set showmatch                   " 括弧の対応をハイライト
set number                      " 行番号表示
set display=uhex                " 印字不可能文字を16進数で表示
set nolist                      " タブや改行文字を表示しない
set noruler                     " ルーラーを表示しない
set formatoptions+=mM           " テキスト挿入中の自動折り返しを日本語に対応
set shellslash                  " ディレクトリの区切り文字に/指定

if &term =~ "xterm-256color"
  " 256 colorの時のカラースキーマ
  set t_Co=256
  colorscheme xoria256
  set background=light
  hi Pmenu ctermbg=lightgray
  hi PmenuSel ctermbg=6
else
  " デフォルトのカラースキーマ
  colorscheme torte
  hi Pmenu ctermbg=4
  hi PmenuSel ctermbg=1
endif

" Explore
let g:netrw_hide=1                " 非表示
let g:netrw_list_hide='^.*.swp'   " swpを非表示
let g:netrw_liststyle=1           " 詳細表示
let g:netrw_browse_split=0        " 0:same 1:split 2:vsplit 3:new

" indent
set autoindent                    " 自動的にインデントする
set smartindent                   " 新規行に対して自動でインデントする
set tabstop=2                     " タブの画面上での幅
set shiftwidth=2
set expandtab                     " タブをスペースに展開する
set smarttab                      " 行頭の余白でタブを押すとshiftwidthだけインデントする

" encoding
set termencoding=utf-8            " ターミナルで使われるエンコーディング
set encoding=utf-8                " デフォルトエンコーディング
set fileencoding=utf-8            " デフォルトのファイルエンコーディング
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932 " vimが表示できるエンコードのリスト

if has('win32') && has('kaoriya')
  set ambiwidth=auto
else
  set ambiwidth=double              " 全角記号文字を半角扱いしない
endif

" search
set wrapscan                        " 検索で最終行まで行ったら先頭に戻る
set ignorecase                      " 大文字小文字無視
set smartcase                       " 大文字ではじめたら大文字小文字無視しない
set incsearch                       " インクリメンタルサーチ
set hlsearch                        " 検索文字をハイライト
set grepprg=git\ grep\ -n\ $*       " grepにgit grepを使用する

" backup
set nobackup                        " バックアップ無効

" menu / complation
set wildmenu            " コマンド補完メニューを表示
set wildmode=full       " 複数のマッチがあるときは全てのマッチを表示し、共通する最長の文字列まで補完
set history=1000        " コマンドの履歴数
set complete+=k         " 補完に辞書ファイル追加

" help
helptags $HOME/.vim/doc
set helplang=ja,en      " ヘルプの検索順序

" keymap ------------------------------------------------------------
imap <C-j> <esc>

" 行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 選択文字で検索
vnoremap * y/<C-r>0<CR>

" visual mode word move
vnoremap v w

" help
nnoremap <C-h> :help<Space>

" grep
nnoremap <C-g> :vimgrep<Space>

" 検索語を画面中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 検索文字のハイライト/アンハイライト
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" window操作
nnoremap + 3<C-w>+
nnoremap - 3<C-w>-
nnoremap { 3<C-w><
nnoremap } 3<C-w>>

" バッファ移動
nnoremap <Space> :bn<CR>
nnoremap <S-Space> :bp<CR>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Down> :ls<CR>

" emacs like key
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Esc><C-b> <S-Left>
cnoremap <Esc><C-f> <S-Right>
inoremap <C-k> <C-o>D
inoremap <C-u> <C-o>dd

inoremap <F5> <ESC>
inoremap <F6> <ESC>
inoremap <F7> <ESC>
inoremap <F8> <ESC>

" 日付入力
inoremap <expr> ,df strftime("%Y-%m-%dT%H:%M:%S")
inoremap <expr> ,dd strftime("%Y-%m-%d")

" 最後に変更したテキストの選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" command -----------------------------------------------------------

" changelog grep
command! -nargs=1 ChangeLogGrep vimgrep /<args>/j ~/changelog | cw

" ファイルエンコーディング指定再読み込み
command! Cp932 edit ++enc=cp932
command! Utf8 edit ++enc=utf-8
command! Euc edit ++enc=euc-jp

" cdpathを考慮した引数補完
command! -complete=customlist, CompleteCD -nargs=? CD cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pat = join(split(a:cmdline, '\s', !0)[1:], ' '), '*/'
  return split(globpath(&cdpath, pat), "\n")
endfunction


" filetype ----------------------------------------------------------
filetype on
filetype indent on  " ファイルタイプによるインデント設定
filetype plugin on  " ファイルタイプごとのプラグイン読み込み

" ruby
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby,eruby setlocal makeprg=ruby\ -c\ %
autocmd FileType ruby,eruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType ruby,eruby setlocal formatoptions-=r " 挿入モードで改行したときにコメントを自動挿入しない
autocmd FileType ruby,eruby setlocal formatoptions-=o " ノーマルモードでoしたときにコメントを自動挿入しない

" changelog
autocmd BufNew,BufRead *.changelog setlocal filetype=changelog
let g:changelog_timeformat="%Y-%m-%d"
let g:changelog_username="mostlyfine@gmail.com"

" action script
autocmd BufNewFile,BufRead *.as setlocal filetype=actionscript
autocmd FileType actionscript setlocal dictionary=$HOME/.vim/dict/actionscript3.dict

" java
autocmd FileType java setlocal dictionary=$HOME/.vim/dict/j2se14.dict

" git
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal filetype=git

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=0
autocmd BufNewFile,BufRead *.thml set filetype=php
autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal dictionary=$HOME/.vim/dict/php.dict

" cucumber
autocmd BufNewFile,BufRead *.feature set filetype=ruby

" yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" other -------------------------------------------------------------

" 挿入モード時ステータスラインの色を変える
autocmd InsertEnter * highlight StatusLine ctermbg=red guibg=red
autocmd InsertLeave * highlight StatusLine ctermbg=darkgray guibg=darkgray

" 自動的にQuickFixリストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

" 全角/行末スペースを表示
scriptencoding utf-8
highlight IgnoreSpace ctermbg=red guibg=red
autocmd Colorscheme * highlight IgnoreSpace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match IgnoreSpace /\s\+$\|　/

" plugin ------------------------------------------------------------

" vim-ruby.vim
let g:rubycomplete_buffer_loading=1     " rubyのomni補完を設定
let g:rubycomplete_classes_in_global=1  " global classもomni補完
let g:rubycomplete_rails=1              " railsのメソッド名もomni補完

" fuzzyfinder.vim
nmap fb :FufBuffer<CR>
nmap ff :FufFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nmap fa :FufFile **/<CR>
nmap fm :FufMruFile<CR>
nmap fl :FufLine<CR>
nmap fq :FuxQuickfix<CR>

let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp'
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumerationLimi = 20

" buftabs.vim
let g:buftabs_only_basename=1           " バッファタブにファイル名のみ表示
let g:buftabs_in_statusline=1           " バッファタブをステータスライン内に表示
let g:buftabs_active_highlight_group="Visual"

" rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

" git-commit.vim
let git_diff_spawn_mode=1               " windowを横に分割

" windows mount
"autocmd BufNewFile,BufRead /mnt/* set nofsync
"autocmd BufNewFile,BufRead /opt/* set nofsync

