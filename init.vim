call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'itchyny/vim-gitbranch'
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ibhagwan/fzf-lua', {'branch' : 'main' }
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
call plug#end()

"neovim options
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

"plugin-configs
:lua require'config.cmp'
:lua require'config.fzf'
:lua require'config.lightline'
:lua require'config.lsp'
:lua require'config.treesitter'

"todo move this
"TODO check rg, fzf, fg configs and get a good setup
nnoremap <leader>fg <cmd>lua require('fzf-lua').grep()<CR>
vnoremap <leader>fg <cmd>lua require('fzf-lua').grep_visual()<CR>
noremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>
