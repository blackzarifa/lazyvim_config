return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          hidden = true,
          layout = {
            layout = { position = "right" }, -- This puts the explorer on the right
          },
          auto_close = true, -- Close explorer when opening a file
        },
      },
      -- On the github issue it says this puts "all sidebars" on the right
      -- (whatever this means, haven't noticed any difference in my tests)
      layouts = {
        sidebar = {
          layout = {
            layout = { position = "right" },
          },
        },
      },
    },
  },
}
