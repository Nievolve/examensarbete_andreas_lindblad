return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- 1. Lägg till din lokala parser i konfigurationen
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

    -- 2. Uppdatera opts-tabellen som skickas till setup()
    -- Vi lägger till "st" i listan över språk som ska vara installerade
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "lua", "vim", "json", "st" })
    end

    -- 3. Se till att highlight är aktiverat
    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  end,
}
