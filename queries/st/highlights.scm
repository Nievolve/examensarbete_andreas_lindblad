; Keywords
(keyword) @keyword
["IF" "THEN" "ELSE" "END_IF" "CASE" "OF" "END_CASE" "FOR" "TO" "BY" "DO" "END_FOR" "WHILE" "END_WHILE" "REPEAT" "UNTIL" "END_REPEAT"] @keyword

; Blocks
["FUNCTION_BLOCK" "END_FUNCTION_BLOCK" "PROGRAM" "END_PROGRAM" "VAR" "VAR_INPUT" "VAR_OUTPUT" "VAR_IN_OUT" "END_VAR"] @type.definition

; Data types
["BOOL" "INT" "DINT" "REAL" "TIME" "STRING" "WORD" "DWORD"] @type

; Functions
(function_declaration (identifier) @function)
(call_expression (identifier) @function.call)

; Comments
(comment) @comment
