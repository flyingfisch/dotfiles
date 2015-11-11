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

let NVIM_TUI_ENABLE_TRUE_COLOR=1
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader = ' '

" plugins
call plug#begin("~/.config/nvim/plugged")

Plug 'https://github.com/scrooloose/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'bling/vim-airline'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'mattn/emmet-vim'

Plug 'Yggdroot/indentLine'

call plug#end()



" colors
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

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

tnoremap <Esc> <C-\><C-n>

" change cursor in insert mode
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

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

let g:user_emmet_expandabbr_key = '<Tab>,'

let g:indentLine_bufNameExclude = ['term://*']
let g:indentLine_fileTypeExclude = ['help', 'nerdtree']

" custom commands
" super retab (http://vim.wikia.com/wiki/VimTip1592)
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

