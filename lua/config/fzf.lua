local fzf = require'fzf-lua'
fzf.setup {
    fzf_colors = {
        ["gutter"] = { "bg", "Normal" },
        ["hl"] = { "fg", "Statement" },
        ["hl+"] = { "fg", "Statement" }
    }
}
fzf.register_ui_select()
