-- LSP调整
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rescriptls = {},
      css_variables = {
        filetypes = { "css", "scss", "less", "svelte" },
      },
    },
  },
}
