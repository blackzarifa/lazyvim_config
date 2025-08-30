return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = true,
                functionTypeParameters = false,
                ignoredError = false,
                parameterNames = false,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
