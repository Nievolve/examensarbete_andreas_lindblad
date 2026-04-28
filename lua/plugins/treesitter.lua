return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  config = function()
    -- 1. Berätta för Treesitter att använda din installerade kompilator
    require("nvim-treesitter.install").compilers = { "gcc" }

    -- 2. Registrera den lokala ST-parsern i systemet innan installation
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.st = {
      install_info = {
        url = vim.fn.stdpath("config") .. "/tree-sitter_ST", -- Sökväg till din mapp
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "st",
    }

    local languages = {
      "st", -- Lade till ditt språk här
      "luadoc",
      "printf",
      "vim",
      "vimdoc",
      "markdown",
      "latex",
      "markdown_inline",
      "query",
      "ini",
      "udev",
      "ssh_config",
      "tmux",
      "diff",
      "git_config",
      "gitcommit",
      "git_rebase",
      "gitignore",
      "gitattributes",
      "regex",
      "sql",
      "lua",
      "bash",
      "java",
      "rust",
      "python",
      "c",
      "asm",
      "cpp",
      "hyprlang",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "yaml",
      "toml",
      "xml",
      "json",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "astro",
      "svelte",
    }

    -- Installera språken
    require("nvim-treesitter.configs").setup({
      ensure_installed = languages,
      highlight = {
        enable = true, -- Viktigt: Detta aktiverar highlighting-motorn
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
