local M = {}

-- Standardkonfiguration
local default_config = {
	lsp = {
		enable = true,
		server_name = "st-server-executable",
	},
	treesitter = {
		ensure_installed = true,
	},
}

function M.setup(user_config)
	-- Merga användarens config med våra defaults (kräver plenary eller enkel loop)
	M.config = vim.tbl_deep_extend("force", default_config, user_config or {})

	-- Aktivera filtypsdetektering
	require("st-pro.core.ftdetect").setup()

	-- Logik för att starta LSP om aktiverat
	if M.config.lsp.enable then
		-- Vi skapar en autocmd som väntar på att en ST-fil öppnas
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "st",
			callback = function()
				-- Här anropar vi vår framtida LSP-modul
				-- require("st-pro.lsp").start()
			end,
		})
	end

	vim.notify("st-pro: Plugin laddat och redo.", vim.log.levels.INFO)
end

return M
