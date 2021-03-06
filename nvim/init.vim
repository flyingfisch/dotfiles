" basic config
set shortmess+=I
filetype off
syntax on
filetype plugin indent on
set number
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set list lcs=tab:\|\ 
set nohlsearch
set scrolloff=5
set nowrap
set ttimeoutlen=22

"True color is enabled in nyaovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader = ' '

" plugins
call plug#begin("~/.config/nvim/plugged")

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'PProvost/vim-markdown-jekyll'
Plug 'othree/html5.vim'
Plug 'edkolev/promptline.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

" colors
let g:gruvbox_contrast_dark="soft"
set background=dark
color gruvbox

" custom keyboard commands
map <Leader>n :NERDTree<CR>

map <leader>> <ESC>:bnext!<CR>
map <leader>< <ESC>:bprev!<CR>
map <leader>x <ESC>:bwipe<CR>

map <leader>r <ESC>:AirlineRefresh<CR>

nmap <leader>w :set wrap linebreak nolist wrapmargin=0 textwidth=0<CR>
nmap <leader>W :set nowrap nolinebreak list<CR>

nmap <leader>f :Files<CR>

tnoremap <Esc> <C-\><C-n>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_modified=1
set laststatus=2

let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\~$']

let g:neosnippet#enable_snipmate_compatibility = 1

let g:indentLine_bufNameExclude = ['term://*']
let g:indentLine_fileTypeExclude = ['help', 'nerdtree']

let g:deoplete#enable_at_startup = 1

let g:promptline_theme = { 'a': [233, 240], 'b': [231,71], 'c': [246,237], 'x': [188,234], 'y': [231,240], 'z': [233,183], 'warn': [232,166] }

" custom commands
" super retab (http://vim.wikia.com/wiki/VimTip1592)
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
