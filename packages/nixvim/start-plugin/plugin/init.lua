-- Options
require("config.options")
require("config.keymaps")
require("config.commands")

require("lz.n").load("lazy")

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
