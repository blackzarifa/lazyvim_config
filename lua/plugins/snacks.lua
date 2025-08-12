return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          -- This puts the explorer on the right
          layout = {
            layout = { position = "right" },
          },
          -- Close explorer when opening a file
          auto_close = true,
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
