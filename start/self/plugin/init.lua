# neovim lua config

-- set this early so that theming can be set up
vim.opt.termguicolors = true

-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  {
      'catppuccin/nvim',
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      init = function()
        vim.cmd [[colorscheme catppuccin-mocha]]
      end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        section_separators = '',
        component_separators = '',
        path = 3,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    },
  },

  {
      'Yggdroot/indentLine',
      init = function()
        vim.g.indentLine_defaultGroup = 'LineNr'
        vim.g.indentLine_char_list = {'|', '¦', '┆', '┊'}
        vim.g.indentLine_conceallevel = 0
      end
  },

  { 'neovimhaskell/haskell-vim' },

  { 'dense-analysis/ale' },

  { 
      'hashivim/vim-terraform',
      init = function()
        vim.g.terraform_fmt_on_save = 1
	vim.g.terraform_align = 1
      end
  },

  {
    'm-col/buffer-closer.nvim',
    opts = {
      close_key = '<BS>',
    },
  },

 {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
        { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
        { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
        { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
        },
        preview = false,
      },
      pickers = {
      },
      extensions = {
      }
    },
  },

  {
      'ctrlpvim/ctrlp.vim',
      init = function()
        vim.g.ctrlp_map = ''  -- Disable the default <C-p> mapping
      end,
  },

  {
      'ludovicchabant/vim-gutentags',
  },

  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<S-Tab>",
      }
    },
  },

  --{
  --  "yetone/avante.nvim",
  --  event = "VeryLazy",
  --  version = false,
  --  opts = {
  --    provider = "gemini",
  --    --provider = "claude",
  --  },
  --  behaviour = {
  --      auto_set_keymaps = false,
  --  },
  --  --hints = { enabled = false },
  --  --windows = {
  --  --    sidebar_header = { enabled = false },
  --  --},
  --  dependencies = {
  --    "nvim-treesitter/nvim-treesitter",
  --    "stevearc/dressing.nvim",
  --    "nvim-lua/plenary.nvim",
  --    "MunifTanjim/nui.nvim",
  --    --- The below dependencies are optional,
  --    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --    "nvim-tree/nvim-web-devicons",
  --    {
  --      -- support for image pasting
  --      "HakonHarnes/img-clip.nvim",
  --      event = "VeryLazy",
  --      opts = {
  --        default = {
  --          embed_image_as_base64 = false,
  --          prompt_for_file_name = false,
  --          drag_and_drop = {
  --            insert_mode = true,
  --          },
  --        },
  --      },
  --    },
  --    {
  --      'MeanderingProgrammer/render-markdown.nvim',
  --      opts = {
  --        file_types = { "Avante" },
  --      },
  --      ft = { "Avante" },
  --    },
  --  },
  --}
})

--local colors = require("catppuccin.palettes").get_palette("mocha")
--vim.cmd("highlight CursorLine gui=reverse")
