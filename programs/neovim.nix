{config, pkgs, ...}:

{
  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      lua
      unzip
      python3
      nodejs
      gcc
      gnumake
    ];

    hm-activation = true;

    extraPlugins = ''
      return {
        {
          "mateusrdc/dockerenv.nvim",
          dependencies = { "neovim/nvim-lspconfig" },
          cmd = "LoadDockerEnv",
          opts = {}
        },
        {
          "kdheepak/lazygit.nvim",
          lazy = true,
          cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
          },
          -- optional for floating window border decoration
            dependencies = {
              "nvim-lua/plenary.nvim",
            },
          -- setting the keybinding for LazyGit with 'keys' is recommended in
          -- order to load the plugin when the command is run for the first time
          keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
          }
        },
      }
    '';
    extraConfig = ''
      local o = vim.o
      o.relativenumber = true

      local map = vim.keymap.set
      map("n", "<leader>a", "ggVG")
      map("n", "<leader>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
      end)
    '';
    chadrcConfig = ''
      local M = {}

      M.base46 = {
        theme = "mountain",

        -- hl_override = {
        -- 	Comment = { italic = true },
        -- 	["@comment"] = { italic = true },
        -- },
      }

      M.nvdash = { load_on_startup = true }
      M.ui = {
        tabufline = {
          lazyload = false
        },
        statusline = {
          theme = "vscode_colored"
        },
        telescope = {
          style = "bordered"
        }
      }

      M.term = {
        sizes = {
          sp = 0.6
        }
      }

      return M
    '';
  };
}
