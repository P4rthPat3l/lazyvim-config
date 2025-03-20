-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<leader>tc", ":Telescope colorscheme<CR>", { noremap = true, silent = true })
-- In normal mode, map to trigger completions
vim.keymap.set("n", "<leader>cc", function()
  require("codeium.virtual_text").complete()
end)