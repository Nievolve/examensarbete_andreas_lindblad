return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- använd senaste master
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "st",
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
      },
    },
    config = function(_, opts)
      -- 1. Hämta parser-modulen säkert
      local parsers = require("nvim-treesitter.parsers")

      -- 2. Registrera din anpassade parser
      local parser_config = parsers.get_parser_configs()
      parser_config.st = {
        install_info = {
          url = "https://github.com/Nievolve/tree-sitter_ST",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "st",
      }

      -- 3. Kör setup med opts-tabellen ovan
      require("nvim-treesitter.configs").setup(opts)

      -- 4. Din autocmd för att säkerställa att ST startar korrekt
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "st",
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf, "st")
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
