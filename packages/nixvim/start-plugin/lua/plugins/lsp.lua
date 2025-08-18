local on_init = function(client, _)
    -- Disable semantic tokens
    client.server_capabilities.semanticTokensProvider = nil
end

local on_attach = function(client, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    local telescope = require("telescope.builtin")
    map("gi", telescope.lsp_implementations, "Goto Implementation")
    map("gr", telescope.lsp_references, "Goto References")

    if client.name == "omnisharp" then
        local omnisharp_extended = require("omnisharp_extended")
        map("gd", omnisharp_extended.lsp_definition, "Goto Definition")
        map("gD", omnisharp_extended.lsp_type_definition, "Goto Declaration")
    else
        map("gd", telescope.lsp_definitions, "Goto Definition")
        map("gD", telescope.lsp_type_definitions, "Goto Declaration")
    end

    map("gn", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, "Goto Next")
    map("gN", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, "Goto Prev")

    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<C-s>", vim.lsp.buf.signature_help, "Signature Help")
    map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
    map("<leader>rn", vim.lsp.buf.rename, "LSP Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("==", function()
        vim.lsp.buf.format({ async = true })
    end, "Format Code")
end

vim.lsp.config("*", { on_init = on_init, on_attach = on_attach })

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

vim.lsp.config("omnisharp", {
    cmd = {
        "OmniSharp",
        "-z",
        "--hostPID",
        tostring(vim.fn.getpid()),
        "DotNet:enablePackageRestore=false",
        "--encoding",
        "utf-8",
        "--languageserver",
    },
    settings = {
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
            AnalyzeOpenDocumentsOnly = true,
            EnableDecompilationSupport = true,
        },
    },
})

vim.lsp.enable({
    "cssls",
    "html",
    "lua_ls",
    "nixd",
    "omnisharp",
    "pyright",
    "rust_analyzer",
    "svelte",
    "ts_ls",
})
