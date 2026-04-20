vim.filetype.add({
	extension = {
		st = "st", -- Standard Structured Text
		iec = "st", -- IEC 61131-3 filer
		pou = "st", -- Program Organization Unit (används ofta i export)
		plccl = "st", -- PLC Control Language
	},
	-- 2. Detektering baserat på filnamn (t.ex. specifika biblioteksfiler)
	filename = {
		["Global_Variables.var"] = "st",
	},
	-- 3. Detektering baserat på innehåll (Heuristik)
	-- Om en .txt-fil börjar med "PROGRAM" eller "FUNCTION_BLOCK", tolka som ST.
	pattern = {
		[".*%.txt"] = function(path, bufnr)
			local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
			if first_line:find("^PROGRAM") or first_line:find("^FUNCTION_BLOCK") then
				return "st" -- Läser bufferten och kontrollar om det är importerad PROGRAM eller FUNCTION BLOCK
			end
		end,
	},
})
