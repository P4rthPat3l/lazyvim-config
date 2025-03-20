-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.linespace = 30
vim.opt.guifont = "Monaco:h12"
vim.opt.scrolloff = 15
vim.opt.laststatus = 3

vim.cmd("colorscheme github_dark")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "wa",
})

vim.g.codeium_debug = true
