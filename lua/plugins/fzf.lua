return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      files = {
        cmd = "fd --type f --hidden --exclude .git",
      },
    })
  end,
}
