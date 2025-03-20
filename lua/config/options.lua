-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Custom status format
vim.opt.statusline:append("%{v:lua.require('codeium.virtual_text').status_string()}")