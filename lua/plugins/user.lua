-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "    █████  ███████ ████████ ██████   ██████",
        "   ██   ██ ██         ██    ██   ██ ██    ██",
        "   ███████ ███████    ██    ██████  ██    ██",
        "   ██   ██      ██    ██    ██   ██ ██    ██",
        "   ██   ██ ███████    ██    ██   ██  ██████",
        "g i t h u b . c o m / e d w e s t f i e l d j r",
        "       ███    ██ ██    ██ ██ ███    ███",
        "       ████   ██ ██    ██ ██ ████  ████",
        "       ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "       ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "       ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "mg979/vim-visual-multi",
    -- event = edit_events,
    init = function()
      vim.cmd "let g:VM_maps = {}"
      vim.cmd "let g:VM_maps['Find Under'] = '<C-x>'"
      vim.cmd "let g:VM_maps['Find Subword Under'] = '<C-x>'"
    end,
    --      override to ensure lsp automatically on new/open file
  },

  -- installed by user on 2023-05-30: https://github.com/barrett-ruth/live-server.nvim
  {
    "barrett-ruth/live-server.nvim",
    build = "npm i -g live-server",
    ft = { "html", "css", "javascript" },
    init = function() vim.keymap.set("n", "=", ":LiveServerToggle<CR>", { desc = "Start Live Server" }) end,
    config = function() require("live-server").setup() end,
  },

  -- installed by user on 2023-09-15: https://github.com/edluffy/hologram.nvim
  {
    "edluffy/hologram.nvim",
    init = function()
      require("hologram").setup {
        auto_display = true, -- WIP automatic markdown image display, may be prone to breakini
      }
    end,
  },
}
