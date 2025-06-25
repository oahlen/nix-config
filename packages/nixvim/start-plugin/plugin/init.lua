-- Options
require("config.options")
require("config.keymaps")
require("config.commands")

lzn = require("lz.n")
lzn.load("lazy")

if os.getenv("NIXVIM_FULL") == "1" then
    lzn.load("lsp")
end

-- Plugins
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.heirline")

require("nvim-autopairs").setup()
require("Comment").setup()
require("ibl").setup()
require("nvim-surround").setup()
require("colorizer").setup()

require("plugins.which-key")
require("plugins.render-markdown")
