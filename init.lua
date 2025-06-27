vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

if vim.g.neovide then
  local uname = vim.loop.os_uname()
  local is_macos = uname.sysname == "Darwin"
  local cmd_key = is_macos and "<D-" or "<S-C-"

  vim.api.nvim_set_keymap('v', cmd_key .. "c>", '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', cmd_key .. "v>", 'l"+P', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', cmd_key .. "v>", '"+P', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('c', cmd_key .. "v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', cmd_key .. "v>", '<ESC>l"+Pli', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', cmd_key .. "v>", '<C-\\><C-n>"+Pi', { noremap = true, silent = true })

  vim.o.guifont = "JetBrains Mono:h13"
end

