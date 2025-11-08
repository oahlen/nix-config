return {
    "conform",
    ft = { "fish", "json", "lua" },
    after = function()
        require("conform").setup({
            formatters_by_ft = {
                fish = { "fish_indent" },
                json = { "jq" },
                lua = { "stylua" },
            },
            formatters = {
                jq = {
                    append_args = { "--indent", "2" },
                },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = false,
            },
        })
    end,
}
