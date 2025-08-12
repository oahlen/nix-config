local on_attach = function(_, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")

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

vim.lsp.config("*", { on_attach = on_attach })

vim.lsp.config("lua_ls", {
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

vim.lsp.config("nixd", {
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

vim.lsp.config("roslyn_ls", {
    settings = {
        ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "none",
            dotnet_compiler_diagnostics_scope = "openFiles",
        },
    },
})

vim.lsp.enable({
    "cssls",
    "html",
    "lua_ls",
    "nixd",
    "pyright",
    "roslyn_ls",
    "rust_analyzer",
    "svelte",
    "ts_ls",
})
