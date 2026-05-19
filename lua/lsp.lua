return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      st_lsp = {
        cmd = { "server.exe" },
        filetypes = { "st" },
        root_dir = function()
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
