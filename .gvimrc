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
  set noimdisable
elseif has('gui_gnome')
"   ubuntu用
  set guifont=M+2VM+IPAG\ circle\ 12
  set guifontset=a14,r14,k14
  lang ja_JP.UTF-8
  set noimdisable
elseif has('gui_macvim')
  set guifont=Osaka-Mono:h18
  set antialias
  set guioptions-=T           " タブ無効化
  set imdisable               " IMを無効化
  set transparency=10         " 透明度指定
  colorscheme macvim
  " 最後のタブを閉じた時に終了
  defaults write org.vim.MacVim MMTerminateAfterLaastWindowClosed yes

  " ファイルのD&D
  defaults write org.vim.MacVim MMOpenFilesInTabs yes
endif

" keymap --------------------------------------------------
" insertモードを抜けるとIME OFF
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0 imsearch=0<CR>

" window --------------------------------------------------
set guioptions+=m         " メニュー表示
set guioptions+=T         " ツールバー表示
set columns=120           " ウィンドウ幅
set lines=50              " ウィンドウ高さ
set guicursor=a:blinkon0  " カーソルを点滅させない

" mouse ---------------------------------------------------
set mouse=a               " マウスを使う
set nomousefocus          " マウスの移動でフォーカスを自動的に切り替えない
set mousehide             " 入力時にマウスポインタを隠す
set guioptions+=a         " 選択後自動的にクリップボードへ
set clipboard+=unnamed    " ペーストを*pでなくpでできるように
