local options = {
    completeopt = { "menu", "menuone", "noselect" }, --autocomplete options: show menu, show menu even if just one entry, do not autoselect
    mouse = "a", --enable mouse
    expandtab = true, --tab inserts space characters
    tabstop = 4, --tab equals 4 spaces
    shiftwidth = 4, --set identation to the same values as tabstop
    number = true, --show absolute line numbers
    ignorecase = true, --case insensitive search
    smartcase = true, --case insensitive search just when searching all lower letters
    --TODO set diffopt+=vertical
    writebackup = false, --don't create backup files
    --TODO shortmess+=c
    signcolumn = "yes", --add a column to the left of the numbers column for signs from lsp for example
    updatetime = 520, --update time in milliseconds
    undofile = true --persist undo tree
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[
	set background=light
	colorscheme PaperColor
]]

