-- Basic config
require("config.lazy")
-- REMAP
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- Commands

vim.api.nvim_create_user_command("convert", function()
  -- Path to open file
  local target_path = vim.fn.expand("%:p")

  local original_filename = vim.fn.expand("%:t")
  local original_directory = vim.fn.expand("%p:h")
  -- Current date
  -- Add time
  local date = os.date("%Y-%m-%-d")
  -- Mosh
  local output_filename = date .. "-" .. original_filename
  local output_path = original_directory .. "/" .. output_filename

  local command = string.format(
    '!python3 "C:\\Users\\andre\\OneDrive - sti.se\\Project\\Python_ETL_ST_XML\\main.py" "%s" "%s"',
    target_path,
    output_path
  )
  vim.cmd(command)
end, {})
