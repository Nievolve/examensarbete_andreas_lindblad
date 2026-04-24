-- Basic config
local nvim_path = vim.fn.stdpath("config")
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- REMAP
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- Strctured Text
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.st = {

  install_info = {
    url = nvim_path .. "/tree-sitting_ST",
    files = { "src/parser.c" },
    generate_requries_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "st",
}
