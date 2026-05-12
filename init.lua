-- Basic config
require("config.lazy")
-- REMAP
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- Commands

vim.api.nvim_create_user_command("Convert", function()
  -- 1. Sökvägar
  local target_path = vim.fn.expand("%:p")
  local original_filename = vim.fn.expand("%:t")
  local original_directory = vim.fn.expand("%:p:h")

  -- 2. "Skrubba" filändelsen: Byt ut .st mot .xml
  -- %-tecknet används för att "escapea" punkten i Lua-patterns
  local clean_filename = string.gsub(original_filename, "%.st$", "")
  local final_output_name = clean_filename .. ".xml"

  -- 3. Datum
  local date = os.date("%Y-%m-%d")

  -- 4. Bygg output-sökväg (Datum-Filnamn.xml)
  local output_filename = date .. "-" .. final_output_name
  local output_path = original_directory .. "\\" .. output_filename

  -- 5. Kommandot
  local command = string.format(
    '!python3 "C:\\Users\\andre\\OneDrive - sti.se\\Project\\Python_ETL_ST_XML\\main.py" "%s" "%s"',
    target_path,
    output_path
  )

  vim.cmd(command)
  print("Exporterad till: " .. output_filename)
end, { desc = "Konverterar .st till .xml via Python" })
