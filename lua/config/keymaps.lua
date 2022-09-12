function keymap (mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

vim.g.mapleader = " "
keymap("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>")
keymap("v", "<leader>fg", "<cmd>lua require('fzf-lua').grep_visual()<CR>")
keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")

keymap("n", "<leader>vv", "<cmd>lua require('fzf-lua').git_status()<CR>")
keymap("n", "<leader>vc", "<cmd>lua require('fzf-lua').git_commits()<CR>")
keymap("n", "<leader>vs", "<cmd>lua require('fzf-lua').git_stash()<CR>")
keymap("n", "<leader>vb", "<cmd>lua require('fzf-lua').git_branches()<CR>")
keymap("n", "<leader>vf", "<cmd>lua require('fzf-lua').git_files()<CR>")
