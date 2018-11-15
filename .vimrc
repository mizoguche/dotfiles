scriptencoding utf-8

"----------------------------------------------------------
" 文字コードの指定
"----------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileencoding=utf-8

"----------------------------------------------------------
" もろもろの設定
"----------------------------------------------------------
"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"クリップボードをWindowsと連携
set clipboard=unnamed,autoselect

"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

"タブの代わりに空白文字を挿入する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"シフト移動幅
set shiftwidth=2

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"小文字で大文字を引っ掛ける。大文字は大文字しか引っ掛けない。
set ignorecase
set smartcase

"カーソル位置の表示
set ruler

"マッチした検索結果をハイライト
set hlsearch

"wildmenu
set wildmenu

"colorscheme
syntax on

"ESC２回押しで検索ハイライトを消去
nnoremap <ESC><ESC> :nohlsearch<CR>

"カーソルでの移動を表示行での移動にする
nnoremap <Down> gj
nnoremap <Up>   gk

" http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$
set display=lastline
set matchtime=1
nnoremap + <C-a>
nnoremap - <C-x>

" Vimgrep後にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow


" ================================
" dein.vim
" ================================

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/mizoguche/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/mizoguche/.cache/dein')
  call dein#begin('/Users/mizoguche/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/mizoguche/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
