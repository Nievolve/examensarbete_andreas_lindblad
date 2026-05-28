vim.api.nvim_create_user_command("Convert", function()
  --  Path
  local target_path = vim.fn.expand("%:p")
  local original_filename = vim.fn.expand("%:t")
  local original_directory = vim.fn.expand("%:p:h")
  -- Cleaning name and add extension
  local clean_filename = string.gsub(original_filename, "%.st$", "")
  local final_output_name = clean_filename .. ".xml"

  --  Add current date to a variable
  local date = os.date("%Y-%m-%d")

  -- Create path for output
  local output_filename = date .. "-" .. final_output_name
  local output_path = original_directory .. "\\" .. output_filename

  -- NVim command execute
  local command = string.format(
    '!python3 "C:\\Users\\andre\\OneDrive - sti.se\\Project\\Python_ETL_ST_XML\\main.py" "%s" "%s"',
    target_path,
    output_path
  )

  vim.cmd(command)
  -- Print for user
  print("Export to: " .. output_filename)
end, { desc = "Converted .st to .xml" })
