local on_init = function(client, _)
    -- Disable semantic tokens
    client.server_capabilities.semanticTokensProvider = nil
end

local on_attach = function(client, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    if client.name == "omnisharp" then
        local omnisharp_extended = require("omnisharp_extended")
        map("gd", omnisharp_extended.lsp_definition, "Goto Definition")
        map("gD", omnisharp_extended.lsp_type_definition, "Goto Declaration")
    else
        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    end

    map("gn", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, "Goto Next")
    map("gN", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, "Goto Prev")

    local telescope = require("telescope.builtin")
    map("gi", telescope.lsp_implementations, "Goto Implementation")
    map("gr", telescope.lsp_references, "Goto References")

    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<C-s>", vim.lsp.buf.signature_help, "Signature Help")
    map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
    map("<leader>rn", vim.lsp.buf.rename, "LSP Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("==", function()
        vim.lsp.buf.format({ async = true })
    end, "Format Code")
end

return {
    {
        "nix",
        ft = "nix",
        after = function()
            require("lspconfig").nixd.setup({
                on_init = on_init,
                on_attach = on_attach,
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
            })
        end,
    },
    {
        "lua",
        ft = "lua",
        after = function()
            require("lspconfig").lua_ls.setup({
                on_init = on_init,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        completion = {
                            keywordSnippet = "Disable",
                        },
                        diagnostics = {
                            globals = { "use", "vim" },
                            disable = { "lowercase-global" },
                        },
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "rust",
        ft = "rust",
        after = function()
            require("lspconfig").rust_analyzer.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
    {
        "python",
        ft = "python",
        after = function()
            require("lspconfig").pyright.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
    {
        "csharp",
        ft = "cs",
        after = function()
            require("lspconfig").omnisharp.setup({
                on_init = on_init,
                on_attach = on_attach,
                cmd = {
                    "OmniSharp",
                    "--languageserver",
                    "--hostPID",
                    tostring(vim.fn.getpid()),
                },
                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true,
                    },
                    RoslynExtensionsOptions = {
                        EnableAnalyzersSupport = false,
                        EnableImportCompletion = true,
                        EnableDecompilationSupport = true,
                    },
                },
            })
        end,
    },
    {
        "html",
        ft = "html",
        after = function()
            require("lspconfig").html.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
    {
        "css",
        ft = "css",
        after = function()
            require("lspconfig").cssls.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
    {
        "javascript",
        ft = { "javascript", "typescript" },
        after = function()
            require("lspconfig").ts_ls.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
    {
        "svelte",
        ft = "svelte",
        after = function()
            require("lspconfig").svelte.setup({ on_init = on_init, on_attach = on_attach })
        end,
    },
}
