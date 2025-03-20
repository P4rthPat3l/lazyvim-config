-- Add this to your plugins configuration (usually in lua/plugins.lua or init.lua)
return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for async operations
      "hrsh7th/nvim-cmp", -- Required for completion source
    },
    config = function()
      require("codeium").setup({
        -- Enable all features
        enable_chat = true,
        enable_cmp_source = true,

        -- Virtual text configuration (inline suggestions)
        virtual_text = {
          enabled = true,
          manual = false, -- Set true for manual trigger only
          filetypes = {}, -- Empty = all filetypes
          default_filetype_enabled = true,
          idle_delay = 75, -- ms delay after typing stops
          virtual_text_priority = 65535,

          -- Key bindings configuration
          map_keys = true,
          accept_fallback = "\t",
          key_bindings = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            clear = "<C-]>",
            next = "<M-]>",
            prev = "<M-[>",
          },
        },

        -- Workspace root detection
        workspace_root = {
          use_lsp = true,
          paths = {
            ".git",
            "package.json",
            "Makefile",
            "Cargo.toml",
            ".svn",
            ".hg",
            ".bzr",
            "_FOSSIL_",
          },
        },
      })

      -- Statusline integration
      local function codeium_status()
        return require("codeium.virtual_text").status_string()
      end

      -- Add to your statusline (example using lualine)
      require("lualine").setup({
        sections = {
          lualine_c = {
            -- ... other components
            { codeium_status }, -- Add Codeium status indicator
          },
        },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require("cmp").setup({
        sources = {
          { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Codeium = "" }
          })
        }
      })
    end
  },

  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({
        symbol_map = {
          Codeium = "",
        },
      })
    end,
  },
}
