require "nvchad.options"

-- add yours here!

local o = vim.o
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#a0a0a0" })
-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
