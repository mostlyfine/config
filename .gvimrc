colorscheme xoria256

" color ---------------------------------------------------
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

" font ----------------------------------------------------
if has('win32')
"   Windows用
  set guifont=M+2VM+IPAG_circle:h11:cSHIFTJIS
  set guifont=MS_Gothic:h11:cSHIFTJIS
"   行間隔の設定
  set linespace=1
  set linespace=2
elseif has('gui_gnome')
"   ubuntu用
  set guifont=M+2VM+IPAG\ circle\ 12
  set guifontset=a14,r14,k14
  lang ja_JP.UTF-8
endif

" keymap --------------------------------------------------
" ESC押したときに自動的に IME OFF
inoremap <ESC> <ESC>:set iminsert=0 imsearch=0<CR>

" window --------------------------------------------------
set guioptions+=m         " メニュー表示
set guioptions+=T         " ツールバー表示
set columns=110           " ウィンドウ幅
set lines=150             " ウィンドウ高さ
set guicursor=a:blinkon0  " カーソルを点滅させない

" mouse ---------------------------------------------------
set mouse=a               " マウスを使う
set nomousefocus          " マウスの移動でフォーカスを自動的に切り替えない
set mousehide             " 入力時にマウスポインタを隠す
set guioptions+=a         " 選択後自動的にクリップボードへ
set clipboard+=unnamed    " ペーストを*pでなくpでできるように
