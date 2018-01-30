set nocompatible
filetype off

set rtp+=/home/bilbo991/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"syntax highlighting for coffee-script
Plugin 'kchmck/vim-coffee-script'

"few QOL changes, like cursor shape changes based on mode
Plugin 'wincent/terminus'

"tagbar to use when working on large projects
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'

"Plugin that extends the number of actions that can be repeated with '.'
Plugin 'tpope/vim-repeat'

"Plugin that adds macros for modifying surrounding ', ", (, etc...
Plugin 'tpope/vim-surround'

"Plugin that provides useful features when editing latex files
Plugin 'lervag/vimtex'

"Removes the annoying swap messages
Plugin 'gioele/vim-autoswap'

"automatically closes html tags
Plugin 'alvan/vim-closetag'

"easy searching and opening of files and buffers
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"Plugin for snippets for various languages
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"auto adds patching parens and square brackets etc. etc.
Plugin 'jiangmiao/auto-pairs'

"nested parens will be given different colors
Plugin 'junegunn/rainbow_parentheses.vim'

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

"automatically remove trailing whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

"settings for html tag closing
let g:closetag_filenames = "*.html, *.php"

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

"enable true color support
set termguicolors
colorscheme gruvbox
syntax on

"automatically set the syntax of bison files to c
autocmd BufNewFile,BufRead *.bison set syntax=c

"enable italics
set t_ZH=[3m
set t_ZR=[23m

let g:gitgutter_override_sign_column_highlight=0
let g:SignatureMarkTextHLDynamic=0

"enable bolds and italics for comments
let g:gruvbox_bold=1
let g:gruvbox_italic=1
highlight Comment cterm=italic

"highlight the line you're on, and set hybrid line numbers
set cursorline
set re=1
set number relativenumber

"disable the mouse settings from terminus
let g:TerminusMouse=0

"turn on and rice code folding based on syntax
set foldmethod=syntax
function! NeatFoldText() "{{{2
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (80*2)/3)
    let foldtextend = lines_count_text . '-- } --+'
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat('-', 80-foldtextlength) . foldtextend . repeat(' ', 80)
endfunction
set foldtext=NeatFoldText()
" }}}2

"more color changes to be black and edgy like my soul
:highlight Folded guibg=black
:highlight Folded guifg=grey
:highlight Normal guibg=black
:highlight SignColumn guibg=black

"gitgutter ricing
:highlight GitGutterChange guibg=black ctermfg=yellow
:highlight GitGutterAdd guibg=black guifg=green
:highlight GitGutterDelete guibg=black guifg=red
:highlight GitGutterChangeDelete guibg=black guifg=cyan
let g:gitgutter_sign_added="●"
let g:gitgutter_sign_modified="●"
let g:gitgutter_sign_removed="●"
let g:gitgutter_sign_modified_removed="●"
let g:gitgutter_sign_removed_first_line="●"

"rainbow parens set to always be on
au VimEnter * RainbowParentheses

"ale linter signs customization
let g:ale_sign_error ='✕'
let g:ale_sign_warning = '⚠'
hi ALEErrorSign guibg=black guifg=red
hi ALEWarningSign guibg=black guifg=yellow

"custom hotkeys
"switches ; to : in normal mode
nnoremap ; :
nnoremap p P
nnoremap P p
nnoremap zz zA
nnoremap <C-p> :FZF<cr>
nnoremap <Space> :Buffers<cr>

inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
