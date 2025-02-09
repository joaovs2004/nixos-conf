return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require "configs.lspconfig"
    end,
  },

  -- {
  --   name = "dockerenv",
  --   lazy = false,
  --   dir = "/home/jvs/Downloads/plugin",
  --   opts = {},
  --   dependencies = { "neovim/nvim-lspconfig" },
  -- },
  --
  {
    dir = "/home/jvs/.config/nvim/lua/plugins/dockerenv.nvim/",
    dependencies = { "neovim/nvim-lspconfig" },
    cmd = "LoadDockerEnv",
    opts = {
      -- binary_mapping_strategy = "inspect_lspconfig",
    }
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
