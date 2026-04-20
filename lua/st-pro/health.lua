local M = {}

M.check = function()
	vim.health.start("st-pro report")
	-- Kontrollera om Tree-sitter parsern är installerad
	local has_ts, _ = pcall(require, "nvim-treesitter.parsers")
	if has_ts and require("nvim-treesitter.parsers").has_parser("st") then
		vim.health.ok("Tree-sitter parser för 'st' hittades.")
	else
		vim.health.warn("Tree-sitter parser för 'st' saknas. Syntax highlighting kan vara begränsad.")
	end

	-- Kontrollera om LSP-servern finns i systemets PATH
	local lsp_bin = "st-server-executable" -- Byt ut mot det faktiska namnet senare
	if vim.fn.executable(lsp_bin) == 1 then
		vim.health.ok(string.format("LSP-binary '%s' hittades i PATH.", lsp_bin))
	else
		vim.health.error(string.format("LSP-binary '%s' hittades inte. Kontrollera din installation.", lsp_bin))
	end
end

return M
