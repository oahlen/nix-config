local wk = require("which-key")

wk.setup({
    icons = {
        mappings = false,
    },
})

wk.add({
    { "<leader>c", group = "Clear" },
    { "<leader>h", group = "Blame Actions" },
    { "<leader>i", group = "Insert" },
    { "<leader>t", group = "Tab" },
})
