return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    local go_formatters = opts.formatters_by_ft.go or {}
    table.insert(go_formatters, "golines")
    opts.formatters_by_ft.go = go_formatters

    opts.formatters = opts.formatters or {}
    opts.formatters.golines = {
      command = "golines",
      args = { "--max-len", "100", "--shorten-comments" },
    }
    opts.formatters.prettier = {
      prepend_args = { "--print-width", "100", "--arrow-parens", "avoid" },
    }

    return opts
  end,
}
