local M = {}

function M.setup()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	-- Registrera ST-parsern om den inte redan finns
	parser_config.st = {
		install_info = {
			url = "https://github.com/jonas-schievink/tree-sitter-st", -- Exempel på en populär ST-parser
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "st",
	}

	-- Om användaren har 'ensure_installed' i vår config, kan vi trigga installation här
	-- Men vi bör i första hand lita på att användaren kör :TSInstall st
end

return M
