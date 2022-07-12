call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'itchyny/vim-gitbranch'
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ibhagwan/fzf-lua', {'branch' : 'main' }
call plug#end()

"neovim options
"TODO completeopt
set completeopt=menu,menuone,noselect "autocomplete options: show menu, show menu even if just one entry, do not autoselect
set mouse=a "enable mouse
set expandtab "tab inserts space characters
set tabstop=4 "tab equals 4 spaces
set shiftwidth=4 "set identation to the same values as tabstop
set number "show absolute line numbers

let mapleader = " " "leader is space
nnoremap <leader>v :e $MYVIMRC<CR>
