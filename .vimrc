"
"source /Users/username/Dropbox/.vimrc
"mkdir ~/vimbackup
"
"----------------------------------------------------------
" 文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileencoding=utf-8
"----------------------------------------------------------

"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"クリップボードをWindowsと連携
set clipboard=unnamed,autoselect

"Vi互換をオフ
set nocompatible

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

"検索をファイルの先頭へループしない
"set nowrapscan

"小文字で大文字を引っ掛ける。大文字は大文字しか引っ掛けない。
set ignorecase
set smartcase

"カーソル位置の表示
set ruler

"マッチした検索結果をハイライト
set hlsearch

"wildmenu
set wildmenu


"unite.vim
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree' "ファイラー
NeoBundle 'thinca/vim-quickrun' "実行結果を確認しながらコーディング
NeoBundle 'othree/eregex.vim.git' " rubyっぽい正規表現
NeoBundle 'skwp/vim-rspec'
NeoBundle 'tpope/vim-rails' " 
NeoBundle 'taichouchou2/vim-endwise' " 
NeoBundle 'tomtom/tcomment_vim' " コメントアウトのトグル
NeoBundle 'basyura/unite-rails' " 
NeoBundle 'm2ym/rsense' " 
NeoBundle 'tpope/vim-fugitive' " 
NeoBundle 'hail2u/vim-css3-syntax' " 
NeoBundle 'groenewege/vim-less' " 
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

" ステータスラインに現在のブランチを表示
set statusline+=%{fugitive#statusline()}
