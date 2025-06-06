# neovim lua config

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
  },
  {
      'ludovicchabant/vim-gutentags',
  },
  --{
  --    'prichrd/netrw.nvim',
  --    dependencies = { 'nvim-tree/nvim-web-devicons' },
  --    opts = {},
  --    use_devicons = true,
  --},
  --{
  --    'nvim-tree/nvim-tree.lua',
  --    lazy = false,
  --    dependencies = {
  --      "nvim-tree/nvim-web-devicons",
  --    },
  --    opts = {},
  --},
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<S-Tab>",
      }
    },
  },
  {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "claude",
    --providers = {
    --  openai = {
    --    endpoint = "https://api.openai.com/v1",
    --    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    --    extra_request_body = {
    --      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    --      temperature = 0.75,
    --      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    --    },
    --  },
    --},
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
})
