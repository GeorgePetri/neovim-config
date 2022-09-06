--todo lua
--TODO check rg, fzf, fg configs and get a good setup
vim.cmd [[
let mapleader = " " "leader is space
nnoremap <leader>v :e $MYVIMRC<CR>

nnoremap <leader>fg <cmd>lua require('fzf-lua').grep()<CR>
vnoremap <leader>fg <cmd>lua require('fzf-lua').grep_visual()<CR>
noremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>
]]
