return {
    "copilot",
    keys = {
        { "<leader>ac", "<CMD>CopilotChatToggle<CR>", desc = "Copilot Chat Toggle" },
        { "<leader>ax", "<CMD>CopilotChatReset<CR>", desc = "Copilot Chat Reset" },
    },
    after = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })

        require("CopilotChat").setup({
            model = "gpt-4.1",
        })

        vim.keymap.set("v", "<leader>e", "<CMD>CopilotChatExplain<CR>", { desc = "Copilot Chat Explain" })
    end,
}
