""" .vimrc 阿部カスタム
" 方針としてはできるだけネイティブな状態で
" これはさくらVPSネイティブの設定がオリジナル


""""""""""""""""""""""""""""""""""""""""""""""
"
"グローバル設定
"
"""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""
" View
""""""""""""""""""""

set number

set t_Co=256
colorscheme darkblue

set ruler		" show the cursor position all the time
set scrolloff=5

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

"if &t_Co > 2 || has("gui_running")
"    syntax on
"    set hlsearch
"endif


""""""""""""""""""""
" Input
""""""""""""""""""""

"タブの代わりに空白文字を挿入する
set expandtab

" always set autoindenting on
set ai 

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4


""""""""""""""""""""
" Move
""""""""""""""""""""


""""""""""""""""""""
" System
""""""""""""""""""""

"tab bashライクタブ保管
set wildmode=list:longest
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)

set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50		" keep 50 lines of command line history

" Only do this part when compiled with support for autocommands
if has("autocmd")
    augroup redhat
        autocmd!
        " In text files, always limit the width of text to 78 characters
        autocmd BufRead *.txt set tw=78
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                    \   exe "normal! g'\"" |
                    \ endif
        " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
        autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
        " start with spec file template
        autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
    augroup END
endif


if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"if &term=="xterm"
"    set t_Co=256
"    set t_Sb=[4%dm
"    set t_Sf=[3%dm
"endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"



""""""""""""""""""""
" Save file
""""""""""""""""""""

if filereadable(expand('~/.vim/functions/savefile.vim'))
    source ~/.vim/functions/savefile.vim
endif


""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin
"
""""""""""""""""""""""""""""""""""""""""""""""

"""Using vundle

if filereadable(expand('~/.vim/functions/vundle.vim'))
    source ~/.vim/functions/vundle.vim
endif
