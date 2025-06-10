local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/",
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(_)
                return { "--hidden" }
            end,
        },
        lsp_references = {
            show_line = false,
        },
    },
})

telescope.load_extension("ui-select")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><space>", "<CMD>Telescope<CR>", { desc = "Open Picker" })
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List Open Buffers" })
vim.keymap.set("n", "<leader>rp", builtin.resume, { desc = "Resume Picker" })
