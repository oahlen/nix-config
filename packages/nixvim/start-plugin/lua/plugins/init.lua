require("plugins.telescope")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.gitsigns")
require("plugins.heirline")

if os.getenv("NIXVIM_FULL") == "1" then
    require("plugins.lsp")
end

require("nvim-autopairs").setup()
require("Comment").setup()
require("ibl").setup()
require("nvim-surround").setup()
require("colorizer").setup()

require("plugins.which-key")
require("plugins.render-markdown")
