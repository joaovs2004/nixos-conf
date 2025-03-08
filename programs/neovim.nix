{config, pkgs, ...}:

{
  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      lua
      gcc
      gnumake
      vtsls
      vscode-langservers-extracted
      pyright
      rust-analyzer
      cargo
      libclang
    ];

    hm-activation = true;
    backup = false;

    extraPlugins = ''
      return {
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

      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local on_init = require("nvchad.configs.lspconfig").on_init
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      local lspconfig = require "lspconfig"
      local servers = { "html", "cssls", "vtsls", "pyright", "rust_analyzer", "clangd"}

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          on_init = on_init,
          capabilities = capabilities,
        }
      end
    '';
    chadrcConfig = ''
      local M = {}

      M.base46 = {
        theme = "kanagawa-dragon",

        -- hl_override = {
        -- 	Comment = { italic = true },
        -- 	["@comment"] = { italic = true },
        -- },
      }

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
