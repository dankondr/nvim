require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "grr", require("telescope.builtin").lsp_references)
map("n", "gi", require("telescope.builtin").lsp_implementations)
map("n", "gd", require("telescope.builtin").lsp_definitions)
map("n", "gt", require("telescope.builtin").lsp_type_definitions)
map("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols)

autocmd({'CursorHold', 'CursorHoldI'}, {
  callback = function (_)
    vim.lsp.buf.document_highlight()
  end
})
autocmd({'CursorMoved'}, {
  callback = function (_)
    vim.lsp.buf.clear_references()
  end
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
