let mapleader=" "

nmap <leader>pv :Ex<CR>
nmap <leader>/ :noh<CR>

imap jk <ESC>
nmap r <C-r>

nmap <C-u> <C-u>zz
nmap <C-d> <C-d>zz
nmap n nzzzv
nmap N Nzzzv

vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

vmap < <gv
vmap > >gv

nmap <leader>cc :cclose<CR>
nmap <leader>co :copen<CR>
nmap <C-j> :cnext<CR>zz
nmap <C-k> :cprev<CR>zz

nmap <leader>s :%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>
vmap <leader>s y:%s/<C-r>\"/<C-r>\"/gI<Left><Left><Left>

command! -nargs=+ Grep execute 'silent vimgrep! <args>' | copen

" Visual settings
set relativenumber number
set scrolloff=5
set display+=lastline

" Sensible Tab Defaults
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab 
set autoindent

" Search/Highlighting/Files
set autoread
set history=1000
set incsearch

" Status bars
set laststatus=2
set ruler
set wildmenu

" Yank to system clipboard
set clipboard=unnamed
