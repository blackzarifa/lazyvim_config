-- Standalone session cleanup script
local function cleanup_old_sessions(days)
  local sessions_dir = vim.fn.stdpath("state") .. "/sessions/"
  local cutoff_time = os.time() - (days * 24 * 60 * 60)

  local handle = vim.uv.fs_scandir(sessions_dir)
  if handle then
    local deleted_count = 0
    while true do
      local name, type = vim.uv.fs_scandir_next(handle)
      if not name then
        break
      end

      if type == "file" and name:match("%.vim$") then
        local filepath = sessions_dir .. name
        local stat = vim.uv.fs_stat(filepath)

        if stat and stat.mtime.sec < cutoff_time then
          vim.uv.fs_unlink(filepath)
          deleted_count = deleted_count + 1
        end
      end
    end
    if deleted_count > 0 then
      print("Deleted " .. deleted_count .. " old session(s)")
    end
  end
end

vim.api.nvim_create_user_command("SessionCleanup", function(args)
  local days = tonumber(args.args) or 30
  cleanup_old_sessions(days)
end, {
  nargs = "?",
  desc = "Delete sessions older than N days (default: 30)",
})

-- Auto cleanup on startup (30 days)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    cleanup_old_sessions(30)
  end,
})

return {}

