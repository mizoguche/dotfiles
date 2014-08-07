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

"カーソルでの移動を表示行での移動にする
nnoremap <Down> gj
nnoremap <Up>   gk

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
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'Shougo/unite.vim'

"Ctrl+lでUnite file
map <C-l> :Unite file<CR>

"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
 
" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}


NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/neosnippet'
let g:neosnippet#snippets_directory = s:my_snippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundle 'scrooloose/syntastic' "構文エラーチェック
NeoBundle 'thinca/vim-quickrun' "実行結果を確認しながらコーディング
NeoBundle 'othree/eregex.vim.git' " rubyっぽい正規表現

" ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'
NeoBundle 'janx/vim-rubytest' " \ t でカーソル位置のテストを実行、 \ T でバッファ内のすべてのテストを実行、 \ l で最後に実行したテストを実行
NeoBundle 'tpope/vim-rake' " :A でRakefile

NeoBundle 'thoughtbot/vim-rspec'
" RSpec.vim mappings
map <Leader><C-r> :call RunCurrentSpecFile()<CR>
map <Leader><C-s> :call RunNearestSpec()<CR>
map <Leader><C-l> :call RunLastSpec()<CR>
map <Leader><C-a> :call RunAllSpecs()<CR>

NeoBundle 'taichouchou2/vim-rsense' "Rubyの補完
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
if filereadable( expand('~/.vim/opt/rsense-0.3/bin/rsense') )
  let g:rsenseHome = expand('~/.vim/opt/rsense-0.3')
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

NeoBundle 'taichouchou2/vim-endwise' " rubyとかで自動的にendを入れてくれる
NeoBundle 'tomtom/tcomment_vim' " <c-_><c-_> でコメントアウトのトグル
NeoBundle 'tpope/vim-fugitive' " 
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'glidenote/memolist.vim' " :MemoNew, :MemoListとかでメモる

" 200msecなんもしなかったり(デフォルト設定)、インサートモードを抜けたりした時に、ファイルが保存される。
NeoBundle 'vim-scripts/vim-auto-save'
" デフォルトで有効にする
let g:auto_save = 1
set updatetime=1

" yankround
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 1000
""履歴一覧(kien/ctrlp.vim)
nnoremap <C-p> :Unite yankround<CR>
nnoremap gg gg "" ggで先頭行に戻りたいけどyankroundが邪魔をしている

NeoBundle 'editorconfig/editorconfig-vim'

" HTML5
NeoBundle 'mattn/emmet-vim'
NeoBundle 'open-browser.vim'
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

" Lightline
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }

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


"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>
 
  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}
