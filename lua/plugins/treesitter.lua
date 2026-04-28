return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- 1. Berätta för Treesitter att använda din GCC-kompilator
    require("nvim-treesitter.install").compilers = { "gcc" }

    -- 2. Registrera språket "st" manuellt
    local parsers = require("nvim-treesitter.parsers")
    parsers.get_parser_configs().st = {
      install_info = {
        url = vim.fn.stdpath("config") .. "/tree-sitter_ST",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "st",
    }

    -- 3. Tvinga in 'st' i listan över installerade språk
    if type(opts.ensure_installed) == "table" then
      table.insert(opts.ensure_installed, "st")
    end
  end,
}
