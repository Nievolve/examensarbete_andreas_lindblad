return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = false,
    ensure_installed = { "lua", "vim", "vimdoc", "json", "yaml", "markdown", "bash", "python", "c", "cpp" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
