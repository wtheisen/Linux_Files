set nocompatible
filetype off

set rtp+=/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'raimondi/delimitmate'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'yggdroot/indentline'

Plugin 'flazz/vim-colorschemes'

call vundle#end()

filetype plugin indent on
autocmd vimenter * NERDTree


"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"auto loads file updates from outside the program
set autoread

"ignores compiled files
set wildignore=*.o,*~,*.pyc

"backspace works luike normal in command mode
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"changes for ignoring case and smart case during searches
set ignorecase
set smartcase
set hlsearch
set incsearch

"highlights matching brackets when selected
set showmatch

"set default encoding
set encoding=utf8

"changes tab to be 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"settings for indentline plugin
let g:indentLine_char = '|'
let g:indentLine_color_term = 239


syntax on
colorscheme CandyPaper
set number
