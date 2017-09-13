set nocompatible
filetype off

set rtp+=/home/bilbo991/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Removes the annoying swap messages
Plugin 'gioele/vim-autoswap'

"automatically closes html tags
Plugin 'alvan/vim-closetag'

"easy searching and opening of files and buffers
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin for snippets for various languages
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"auto adds patching parens and square brackets etc. etc.
Plugin 'jiangmiao/auto-pairs'

"nested parens will be given different colors
Plugin 'kien/rainbow_parentheses.vim'

"allows mass commenting and uncommenting
Plugin 'tpope/vim-commentary'

"adds an indent level indicator line
Plugin 'yggdroot/indentline'

"changes the status line
Plugin 'vim-airline/vim-airline'

"highlight and allow removal of trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

"show changes of files with git information in the gutter
Plugin 'airblade/vim-gitgutter'

"code completion plugin
Plugin 'maralla/completor.vim'

"colorscheme
Plugin 'morhetz/gruvbox'

"themes for the status bar
Plugin 'vim-airline/vim-airline-themes'

"plugin for visually displaying bookmarks
Plugin 'kshenoy/vim-signature'

"plugin for fancy icons
Plugin 'ryanoasis/vim-devicons'

"helps with aligning text
Plugin 'godlygeek/tabular'

"Asynchronous error checking
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on

let g:airline_powerline_fonts = 1

autocmd BufEnter * EnableStripWhitespaceOnSave

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

"Changes the shape of the cursor depending on the mode, hardcoded for xfce4
if has("autocmd")
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
  au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
endif

"settings for html tag closing
let g:closetag_filenames = "*.html"

"vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

"auto loads file updates from outside the program
set autoread

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

"make backspace act like normal
set backspace=indent,eol,start

"settings for indentline plugin
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

"settings for the status bar
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''

"settings for gitgutter
set updatetime=250

"fix the delay when switching insert-->normal
set timeoutlen=1000 ttimeoutlen=0

"turn on line numbers and set the 80 character line
set number
set nowrap
set colorcolumn=80
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
syntax on
:highlight Normal ctermbg=black
:highlight SignColumn ctermbg=black
set term=screen-256color

"rainbow parens set to always be on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"ale linter signs customization
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
hi ALEErrorSign ctermbg=black ctermfg=196
hi ALEWarningSign ctermbg=black ctermfg=226

"custom hotkeys
"switches ; to : in normal mode
nnoremap ; :

inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" let g:UltiSnipsExpandTrigger="<cr>"
