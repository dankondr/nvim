require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "grr", require("telescope.builtin").lsp_references)
map("n", "gi", require("telescope.builtin").lsp_implementations)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
