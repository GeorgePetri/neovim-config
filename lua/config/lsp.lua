local opts = { noremap=true, silent=true }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
function bind_common(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
end

local lspconfig = require'lspconfig'

-- TypeScript
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        bind_common(client, bufnr)
    end
}

-- Svelte
lspconfig.svelte.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        bind_common(client, bufnr)
    end
}

-- C#
--todo add other c# bindings
lspconfig.omnisharp.setup {
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
