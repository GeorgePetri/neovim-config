vim.cmd [[
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
]]
