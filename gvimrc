""" .gvimrc 阿部カスタム


""""""""""""""""""""""""""""""""""""""""""""""
"
" ノーマルモード
"
""""""""""""""""""""""""""""""""""""""""""""""

" 行頭,行末,削除
noremap <C-a> ^
noremap <C-e> $
noremap <C-d> <Del>
noremap <C-k> C <esc>



""""""""""""""""""""""""""""""""""""""""""""""
"
" 挿入モード
"
""""""""""""""""""""""""""""""""""""""""""""""

"カッコ入力時にカーソルを真ん中に
inoremap {} {}<left>
inoremap [] []<left>
inoremap () ()<left>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap <> <><left>

"""Myjumpto function

if filereadable(expand('~/vim/functions/in_Myjumpto.vim'))
    source ~/vim/functions/in_Myjumpto.vim
endif

"行末まで削除
inoremap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
"行頭へ
inoremap <silent> <C-a> <C-r>=MyJumptoBol('　。、．，／！？「」')<CR>
"行末へ
inoremap <silent> <C-e> <C-r>=MyJumptoEol('　。、．，／！？「」')<CR>


""""""""""""""""""""""""""""""""""""""""""""""
"
"グローバル設定
"
""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""
" View
""""""""""""""""""""

"colorscheme 設定
colorscheme darkblue

"fontの設定
set gfn=Osaka-Mono:h17
set gfw=

"縦幅
set lines=50
"横幅
set columns=150

" カーソルの上または下に表示する最小限の行数
set scrolloff=5

" 入力されているテキストの最大幅 「0」で無効
set textwidth=0

"行番号を表示する
set number

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"current line highlight
"set cursorline 

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook

    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END


""""""""""""""""""""
" Save file
""""""""""""""""""""

if filereadable(expand('~/vim/functions/savefile.vim'))
    source ~/vim/functions/savefile.vim
endif

""""""""""""""""""""
" System
""""""""""""""""""""

"Vi互換をオフ
set nocompatible
"tab bashライクタブ保管
set wildmode=list:longest
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<


""""""""""""""""""""
" Input
""""""""""""""""""""

"タブの代わりに空白文字を挿入する
set expandtab
" バックスペースでインデントや改行を削除できるようにする
"set backspace=indent,eol,start
" 自動整形の実行方法
"set formatoptions=lmoq

"新しい行のインデントを現在行と同じにする
set autoindent

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4


""""""""""""""""""""
" Move
""""""""""""""""""""

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  <  - [←]        ノーマルモード ビジュアルモード
"  >  - [→]         ノーマルモード ビジュアルモード
"  [ - [←]         挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,<,>,[,],~

"インクリメンタルサーチを行う
set incsearch

"シフト移動幅
"set shiftwidth=4

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab

"ファイル内の  が対応する空白の数
"set tabstop=4

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
"set nowrapscan"


""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin
"
""""""""""""""""""""""""""""""""""""""""""""""

"""Using vundle

if filereadable(expand('~/vim/functions/vundle.vim'))
    source ~/vim/functions/vundle.vim
endif
