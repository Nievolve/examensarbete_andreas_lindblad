return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    version = false,
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      {
        "Nievolve/tree-sitter_ST",
        branch = "dev",
        lazy = false,
      },
    },
    config = function()
      local ok, lazy_config = pcall(require, "lazy.core.config")
      local st_plugin = ok and lazy_config.plugins["tree-sitter_ST"] or nil
      local st_parser_path = st_plugin and st_plugin.dir or (vim.fn.stdpath("data") .. "/lazy/tree-sitter_ST")

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.st = {
        install_info = {
          url = st_parser_path,
          files = { "src/parser.c" },
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "st",
      }

      vim.treesitter.language.register("st", "st")

      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "master",
  },
}
