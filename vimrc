let mapleader=" "

nmap <leader>pv :Ex<CR>
nmap <leader>/ :noh<CR>

imap jk <ESC>
nmap r <C-r>

imap <S-Tab> <C-d>

nmap <C-u> <C-u>zz
nmap <C-d> <C-d>zz
nmap n nzzzv
nmap N Nzzzv

vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

vmap < <gv
vmap > >gv

nmap <leader>s :%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>
vmap <leader>s y:%s/<C-r>\"/<C-r>\"/gI<Left><Left><Left>

command! -nargs=+ Grep execute 'silent vimgrep! <args>' | copen

" Visual settings
set relativenumber number
set scrolloff=10
set display+=lastline
set signcolumn=yes
set colorcolumn=80

" Sensible Tab Defaults
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab 
set autoindent

" Text settings
set ignorecase
set smartcase
set backspace=indent,eol,start

" Search/Highlighting/Files
set autoread
set incsearch
set history=1000

" Status bars
set laststatus=2
set ruler

" Wildmenu
set wildmenu
set wildmode=longest:full,full

" Yank to system clipboard
set clipboard=unnamed
