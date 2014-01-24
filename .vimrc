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

"小文字で大文字を引っ掛ける。大文字は大文字しか引っ掛けない。
set ignorecase
set smartcase

"カーソル位置の表示
set ruler

"マッチした検索結果をハイライト
set hlsearch

"wildmenu
set wildmenu

"ESC２回押しで検索ハイライトを消去
nnoremap <ESC><ESC> :nohlsearch<CR>

"Ctrl+nでNERDTreeをトグル
map <C-l> :NERDTreeToggle<CR>

"----------------------------------------------------------
" プラグイン
"----------------------------------------------------------
"unite.vim
set nocompatible              " be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
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
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'YankRing.vim' " PしたあとにC-P, C-Nでヤンクの履歴をたどれる
NeoBundle 'glidenote/memolist.vim' " :MemoNew, :MemoListとかでメモる

NeoBundle 'editorconfig/editorconfig-vim'

" HTML5
NeoBundle 'mattn/emmet-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less' " 
NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

"NeoBundle 'plasticboy/vim-markdown' 
" markdownで項目をfoldしない
"let g:vim_markdown_folding_disabled=1
" markdown viewer
" 事前に下記を実行しとく
"
" $ brew install nodejs
" $ gem install redcarpet pygments.rb
" $ npm -g install instant-markdown-d
NeoBundle 'tpope/vim-markdown'
NeoBundle 'suan/vim-instant-markdown'
filetype plugin on
" you need this for zsh   
set shell=bash\ -i

let g:user_emmet_settings = {
  \  'lang' : 'ja',
  \  'indentation' : '  ',
  \  'perl' : {
  \    'aliases' : {
  \      'req' : 'require '
  \    },
  \    'snippets' : {
  \      'use' : "use strict\nuse warnings\n\n",
  \      'warn' : "warn \"|\";",
  \    }
  \  }
  \}

"gist.vim
let g:gist_show_privates = 1
let g:gist_post_private = 1

" 補完のポップアップの色
hi Pmenu ctermbg=darkblue
hi PmenuSel ctermbg=darkcyan
hi PmenuSbar ctermbg=0

"YankRingのShowコマンドの設定
nnoremap <silent> <F7> :YRShow<CR>
let g:yankring_max_history = 15
let g:yankring_window_height = 13

filetype plugin indent on     " required!
filetype indent on
syntax on

" ステータスラインに現在のブランチを表示
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
au InsertEnter * hi StatusLine guifg=white guibg=darkblue gui=none ctermfg=white ctermbg=darkblue cterm=none
au InsertLeave * hi StatusLine guifg=white guibg=darkgray gui=none ctermfg=white ctermbg=darkgray cterm=none

 
"----------------------------------------
" open-browsere
"----------------------------------------
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
 
 
"----------------------------------------
" vim-browsereload-mac
"----------------------------------------
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "iTerm"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>
