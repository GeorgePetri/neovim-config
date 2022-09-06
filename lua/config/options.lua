--todo lua
vim.cmd [[
set completeopt=menu,menuone,noselect "autocomplete options: show menu, show menu even if just one entry, do not autoselect
set mouse=a "enable mouse
set expandtab "tab inserts space characters
set tabstop=4 "tab equals 4 spaces
set shiftwidth=4 "set identation to the same values as tabstop
set number "show absolute line numbers
set ignorecase "case insensitive search
set smartcase "case insensitive search just when searching all lower letters
"TODO set diffopt+=vertical
set nowritebackup "don't create backup files
"TODO shortmess+=c
set signcolumn=yes "add a column to the left of the numbers column for signs from lsp for example
set updatetime=520 "update time in milliseconds
set undofile "persist undo tree

let mapleader = " " "leader is space
nnoremap <leader>v :e $MYVIMRC<CR>

"theme
set background=light
colorscheme PaperColor
]]
