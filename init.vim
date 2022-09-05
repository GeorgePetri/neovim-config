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
:lua require'config.treesitter'

"todo move this
"TODO check rg, fzf, fg configs and get a good setup
nnoremap <leader>fg <cmd>lua require('fzf-lua').grep()<CR>
vnoremap <leader>fg <cmd>lua require('fzf-lua').grep_visual()<CR>
noremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>

"vim-gitbranch and lightline.vim
let g:lightline = {
        \ 'colorscheme': 'PaperColor',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \       [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gitbranch#name'
        \ },
        \ }

"lsp-config
lua << EOF
local opts = { noremap=true, silent=true }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
function bind_common(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
        --todo bind ctrl space
end

-- TypeScript
require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        bind_common(client, bufnr)
    end
}

-- Svelte
require'lspconfig'.svelte.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        bind_common(client, bufnr)
    end
}

-- C#
--todo add other c# bindings
require'lspconfig'.omnisharp.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        bind_common(client, bufnr)

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua require(\'fzf-lua\').lsp_references()<CR>', opts)
        --todo test
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    end,
    cmd = { "/omnisharp/OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true
}
EOF
