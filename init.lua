-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
