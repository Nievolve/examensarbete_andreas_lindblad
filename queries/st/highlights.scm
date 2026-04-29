["PROGRAM" "END_PROGRAM" "VAR" "END_VAR"] @keyword

(variable_declaration (identifier) @variable)
(type_identifier) @type

(number) @number
":=" @operator
";" @punctuation.terminator
