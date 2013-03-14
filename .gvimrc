"let file_name = expand("%")
"if has('vim_starting') &&  file_name == ""
"    autocmd VimEnter * BundleInstall
"    autocmd VimEnter * NERDTree ./
"endif

colorscheme darkblue
"fontの設定
set gfn=Osaka-Mono:h17
set gfw=


"
" ノーマルモード
"
" 行頭,行末,削除
noremap <C-a> ^
noremap <C-e> <End>
noremap <C-d> <Del>
noremap <C-k> C <esc>


"
" 挿入モード
"
inoremap {} {}<left>
inoremap [] []<left>
inoremap () ()<left>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap <> <><left>

"行末まで削除
"inoremap <C-k> <C-o>D
inoremap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
"行頭へ
inoremap <silent> <C-a> <C-r>=MyJumptoBol('　。、．，／！？「」')<CR>
"行末へ
inoremap <silent> <C-e> <C-r>=MyJumptoEol('　。、．，／！？「」')<CR>
""""""""""""""""""""""""""""""
"sepが空でなければ、sepをセパレータとしてジャンプ。
"見つからなければ見かけの行頭へ。
"カーソル位置が見かけの行頭の場合は真の行頭へ。
""""""""""""""""""""""""""""""
function! MyJumptoBol(sep)
    if col('.') == 1
        call cursor(line('.')-1, col('$'))
        call cursor(line('.'), col('$'))
        return ''
    endif
    if matchend(strpart(getline('.'), 0, col('.')), '[[:blank:]]\+') >= col('.')-1
        silent exec 'normal! 0'
        return ''
    endif
    if a:sep != ''
        call search('[^'.a:sep.']\+', 'bW', line("."))
        if col('.') == 1
            silent exec 'normal! ^'
        endif
        return ''
    endif
    exec 'normal! ^'
    return ''
endfunction

""""""""""""""""""""""""""""""
"sepが空でなければ、sepをセパレータとしてジャンプ。
"見つからなければ行末へ。
""""""""""""""""""""""""""""""
function! MyJumptoEol(sep)
    if col('.') == col('$')
        silent exec 'normal! w'
        return ''
    endif

    if a:sep != ''
        let prevcol = col('.')
        call search('['.a:sep.']\+[^'.a:sep.']', 'eW', line("."))
        if col('.') != prevcol
            return ''
        endif
    endif
    call cursor(line('.'), col('$'))
    return ''
endfunction

""""""""""""""""""""""""""""""
"行末でも停止する単語単位移動コマンド
""""""""""""""""""""""""""""""
function! MyMoveWord_i(cmd)
    let isEol = 0
    if col('$') == col('.')
        let isEol = 1
    endif
    let prevline = line('.')
    silent exec 'normal! '.a:cmd
    if line('.') == prevline
        return ''
    endif
    if a:cmd == 'w'
        if isEol == 0
            call cursor(prevline, 0)
            call cursor(line('.'), col('$'))
        endif
        if line('.') - prevline > 1
            call cursor(prevline+1, 0)
            call cursor(line('.'), col('$'))
        endif
    elseif a:cmd == 'b'
        call cursor(line('.'), col('$'))
        if prevline - line('.') > 1
            call cursor(prevline-1, 0)
            call cursor(line('.'), col('$'))
        endif
    endif
    return ''
endfunction



"tab bashライクタブ保管
"set wildmode=longest,list
set wildmode=list:longest
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"Vi互換をオフ
set nocompatible
"swapfile使わない
set noswapfile
"バックアップファイルを作らない
set nobackup
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" バックスペースでインデントや改行を削除できるようにする
"set backspace=indent,eol,start
" 自動整形の実行方法
set formatoptions=lmoq
" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  <  - [←]        ノーマルモード ビジュアルモード
"  >  - [→]         ノーマルモード ビジュアルモード
"  [ - [←]         挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,<,>,[,],~
" ステータス行を常に表示する
"set laststatus=2
"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
"set list"

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number

"シフト移動幅
"set shiftwidth=4

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab

"ファイル内の  が対応する空白の数
"set tabstop=4

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
"set nowrapscan"

"縦幅
set lines=50
"横幅
set columns=150

" カーソルの上または下に表示する最小限の行数
set scrolloff=5

" 入力されているテキストの最大幅 「0」で無効
set textwidth=0







"入力モード時、ステータスラインのカラーを変更
augroup InsertHook

    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4


set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'rails.vim'
"Bundle 'The-NERD-Commenter'
"Bundle 'quickrun.vim'
Bundle 'neocomplcache'
"Bundle 'ZenCoding.vim'
Bundle 'html5.vim'
Bundle 'The-NERD-tree'
Bundle 'css_color.vim'
Bundle 'h1mesuke/vim-alignta'
Bundle "pangloss/vim-javascript"
Bundle "briancollins/vim-jst"

" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
