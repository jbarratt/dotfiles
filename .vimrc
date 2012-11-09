runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nobackup
set noswapfile

" force me to stop using lazy arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"set ai to terse nowarn sm ruler redraw sw=2 ts=2
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
set ai
set to "timeout for getting commands
set ruler redraw
set smartcase
set expandtab smarttab

set bs=2
set hls

" supposed to make vim use the system clipboard
set clipboard=unnamed

" for when you edit a file you forgot you'll need perms for afterwards
cmap w!! w !sudo tee % >/dev/null

" 1 liner emulation of a.vim
map <leader>a :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1

" make jj work to get you out of modes
imap jj <Esc>

syntax enable
filetype plugin indent on

set background=dark
colorscheme solarized

let mapleader = ','

set wildmenu

au BufNewFile,BufRead *.t set filetype=perl

" fuzzy finder (lifted from justone)
let g:fuf_modesDisable = [ 'mrucmd', ]
let g:fuf_coveragefile_exclude = '\v\~$|blib|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)|svn-base$'
let g:fuf_maxMenuWidth = 150
"let g:fuf_previewHeight = 20

noremap <leader>ff :FufCoverageFile<CR>
noremap <leader>fr :FufMruFile<CR>
noremap <leader>fl :FufMruFileInCwd<CR>
noremap <leader>ft :FufTag<CR>
noremap <leader>fb :FufBuffer<CR>
noremap <leader>fc :FufRenewCache<CR>

" make SPACE do a 'next page'
nnoremap <SPACE> <PAGEDOWN>

" auto-reload vimrc files if you edit them
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" tune undo history; keep things forever but consildated
if has('persistent_undo')
    set undofile
endif

set undodir=$HOME/tmp/.VIM_UNDO_FILES
set undolevels=5000

" turn on block mode (get to it with CTRL-V) virtualedit (no char needed)
set virtualedit=block

" when I open a file jump back to where my cursor was
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") 
\|  exe "normal! g`\""
\| endif

" make window nav like tmux
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:pymode_lint_checker = "pep8,mccabe"
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" custom surroundings for confluence editing
" 'l' for literal. So 'ysWl' to surround from cursor to end of word
let g:surround_108 = "{{\r}}"
" 'n' for noformat
let g:surround_110 = "{noformat}\r{noformat}"
