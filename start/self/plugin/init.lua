# neovim lua config

require("supermaven-nvim").setup({
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<S-Tab>",
  }
})

require('lualine').setup({
    options = { section_separators = '', component_separators = '' }
})
