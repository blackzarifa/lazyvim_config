-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove LazyVim "search" for default Vim `s` bind
vim.keymap.del("n", "s")

-- Notification history with copy and actually working
vim.keymap.set("n", "<leader>N", function()
  Snacks.notifier.show_history({ win = { bo = { modifiable = true } } })
  vim.defer_fn(function()
    vim.wo.wrap = true
  end, 10)
end, { desc = "Readable Notification History" })
