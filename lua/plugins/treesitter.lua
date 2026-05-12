return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- optional?
  lazy = false,
  config = function()
    require("nvim-treesitter.install").compilers = { "gcc" }
    -- get_parser_configs verkar inte fungera
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- Hur lägger man till en parser från github/local?
    parser_config.st = {
      install_info = {
        url = "https://github.com/Nievolve/tree-sitter_ST",
        files = { "src/parser.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "st",
    }

    local languages = {
      "st", -- Structured Text
      "vim",
      "markdown",
      "latex",
      "query",
      "bash",
      "java",
      "rust",
      "python",
      "c",
      "hyprlang",
      "yaml",
      "xml",
      "json",
      "html",
      "css",
      "javascript",
      "typescript",
    }

    -- Installera språken
    require("nvim-treesitter.configs").setup({
      ensure_installed = languages,
      highlight = {
        enable = true,
      },
    })

    -- Din befintliga autocmd för att starta Treesitter
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype) or vim.bo[buf].filetype
        local ok, _ = pcall(vim.treesitter.start, buf, lang)
        if ok then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
