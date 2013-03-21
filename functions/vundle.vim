"
" Using Vundle
"


filetype off                   " required!
set rtp+=~/vim/bundle/vundle/
call vundle#rc('~/vim/bundle')
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:

" original repos on github
"Bundle 'h1mesuke/vim-alignta'
Bundle 'tsaleh/vim-align'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'

" vim-scripts repos
Bundle 'neocomplcache'
Bundle 'html5.vim'
Bundle 'The-NERD-tree'
Bundle 'css_color.vim'
Bundle 'Markdown'
Bundle 'quickrun.vim'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"Bundle 'The-NERD-Commenter'
"Bundle 'quickrun.vim'
"Bundle 'ZenCoding.vim'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

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
