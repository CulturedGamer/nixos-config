local options = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>cc", ":!tmux next-window \\; send-keys 'cargo build' Enter<CR>", options)
vim.keymap.set("n", "<leader>cv", ":!tmux next-window \\; send-keys 'cargo run' Enter<CR>", options)
vim.keymap.set(
  "n",
  "<leader>cb",
  ":!tmux next-window \\; send-keys \"cargo run --bin $(echo % | sed -e 's/.*\\///' -e 's/\\..*//')\" Enter<CR>",
  options
)
