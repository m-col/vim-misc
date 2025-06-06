-- Load netrw after all initialization is complete
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("packadd netrw")
    -- Ensure the netrw functions are available
    vim.cmd("runtime! autoload/netrw.vim")

    vim.cmd([[
      function! NetrwMapping()
        nmap <buffer> h -
        nmap <buffer> l <CR>
      endfunction

      augroup netrw_mapping
        autocmd!
        autocmd FileType netrw call NetrwMapping()
      augroup END
    ]])
  end,
  group = vim.api.nvim_create_augroup("NetrwLoader", { clear = true }),
  desc = "Load netrw after VimEnter"
})

