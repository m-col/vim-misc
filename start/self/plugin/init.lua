# neovim lua config

require("supermaven-nvim").setup({
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<S-Tab>",
  }
})

require('lualine').setup({
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
})
