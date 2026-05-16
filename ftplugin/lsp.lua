return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      st_lsp = {
        cmd = { "server.exe" },
        filetypes = { "st" },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".git")(fname) or vim.fn.getcwd()
        end,
        single_file_support = true,
      },
    },
  },
}
