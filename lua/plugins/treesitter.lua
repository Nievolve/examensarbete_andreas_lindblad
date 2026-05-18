return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    config = function()
      local parser_config = require("nvim-treesitter.parsers")
      parser_config.st = {
        install_info = {
          url = "https://github.com/Nievolve/tree-sitter_ST",
          files = { "src/parser.c" },
          branch = "dev",
          revision = "",
        },
        filetype = "st",
        tier = 3,
      }

      -- Ny syntax utan .configs
      require("nvim-treesitter").setup({
        highlight = { enable = true },
      })
    end,
  },
}
