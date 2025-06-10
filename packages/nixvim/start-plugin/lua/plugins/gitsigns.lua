require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<space>hb", function()
            gs.blame_line({ full = true })
        end, { desc = "Blame Line", buffer = bufnr })
        vim.keymap.set("n", "<space>ht", gs.toggle_current_line_blame, { desc = "Toggle Line Blame", buffer = bufnr })
    end,
})
