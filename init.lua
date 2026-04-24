-- Basic config
-- PATH
local nvim_path = vim.fn.stdpath("config") -- dynamic path to nvim
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- REMAP
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- Structure Text
local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if ok then
  local configs = parsers.get_parser_configs()
  configs.st = {
    install_info = {
      url = nvim_path .. "/tree-sitter_ST",
      files = { "src/parser.c" },
      branch = "main",
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
    filetype = "st",
  }
end
