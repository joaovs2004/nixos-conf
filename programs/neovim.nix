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
        }
      }
    '';
    extraConfig = ''
      local map = vim.keymap.set
      map("n", "<leader>a", "ggVG")
      map("n", "<leader>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
      end)

      if vim.g.neovide then
        vim.o.guifont = "Fira Code:h12"
        vim.g.neovide_cursor_animation_length = 0
      end
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
