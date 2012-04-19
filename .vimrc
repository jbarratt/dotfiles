runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nobackup
set noswapfile

" force me to stop using lazy arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set ai to terse nowarn sm ruler redraw sw=4 ts=4
set smartcase
set expandtab smarttab

set bs=2
set hls

" for when you edit a file you forgot you'll need perms for afterwards
cmap w!! w !sudo tee % >/dev/null

" 1 liner emulation of a.vim
map <leader>a :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1

imap uu _
imap hh =>
imap aa @

" make jj work to get you out of modes
imap jj <Esc>

syntax enable
filetype plugin indent on

set background=dark
colorscheme solarized

let mapleader = ','

set wildmenu

au BufNewFile,BufRead *.t set filetype=perl
