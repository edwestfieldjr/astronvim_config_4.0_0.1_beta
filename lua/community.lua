-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },

  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },

  { import = "astrocommunity.file-explorer.oil-nvim" },
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
        max_width = 100,
        max_height = 80,
      },
    },
    init = function()
      vim.keymap.set("n", "<A-2>", require("oil").toggle_float, { desc = "Toogle Oil" })
      vim.keymap.set("n", "<A-3>", require("oil").toggle_hidden, { desc = "Oil: Toogle Hidden" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { import = "astrocommunity.editing-support.auto-save-nvim" },
  {
    "pocco81/auto-save.nvim",
    init = function() vim.keymap.set("n", "<leader>v", ":ASToggle<CR>", { desc = "toggle auto-save" }) end,
  },

  { import = "astrocommunity.color.ccc-nvim" },
  -- CUSTOM CONFIG NOT WORKING - 01-APR-2024
  -- {
  --   "uga-rosa/ccc.nvim",
  --   init = function()
  --     local ccc = require "ccc"
  --     local mapping = ccc.mapping
  --     ccc.setup {
  --       opts = {
  --         -- Your preferred settings
  --         -- Example: enable highlighter
  --         lsp = true,
  --         highlighter = {
  --           auto_enable = true,
  --         },
  --         pickers = {
  --           ccc.picker.hex,
  --           ccc.picker.css_rgb,
  --           ccc.picker.css_hsl,
  --           ccc.picker.css_hwb,
  --           ccc.picker.css_lab,
  --           ccc.picker.css_lch,
  --           ccc.picker.css_oklab,
  --           ccc.picker.css_oklch,
  --           ccc.picker.css_name,
  --         },
  --         convert = {
  --           { ccc.picker.hex, ccc.output.css_rgb },
  --           { ccc.picker.css_rgb, ccc.output.hex },
  --         },
  --         mappings = {
  --           ["<Esc>"] = mapping.quit,
  --         },
  --       },
  --     }
  --   end,
  -- },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  {
    "stevearc/overseer.nvim",
    opts = {},
  },
  { import = "astrocommunity.pack.pkl" }, -- import/override with your plugins folder
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.go" },
}
