""" .gvimrc 阿部カスタム

".vimrcの設定に上書きする形


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
"colorscheme chlordane
"colorscheme matrix

"fontの設定
set gfn=Osaka-Mono:h17
set gfw=


"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END


"縦幅
set lines=50
"横幅
set columns=150


""""""""""""""""""""
" System
""""""""""""""""""""



""""""""""""""""""""
" Input
""""""""""""""""""""




""""""""""""""""""""
" Move
""""""""""""""""""""

