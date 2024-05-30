-- Ensure lazy.nvim is installed
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Leader>pv', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Vim settings
vim.wo.relativenumber = true

-- Lazy.nvim Configuration
local plugins = {
	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope.nvim'}
}

local opts = {}

-- Setup Lazy.nvim
require("lazy").setup(plugins, opts)

-- Key remap
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Leader>pv', ':<C-u>Ex<CR>', { noremap = true })
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
