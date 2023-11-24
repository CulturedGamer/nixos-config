vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.lua", "*.neorg" },
  command = "set shiftwidth=2 tabstop=2",
})
