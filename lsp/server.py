import sys
from pygls.server import LanguageServer
from lsprotocol.types import TEXT_DOCUMENT_COMPLETION, CompletionItem, CompletionList, CompletionParams

server = LanguageServer("st-language-server", "v0.1.0")

# Registrera vad som ska hända när Neovim ber om autokomplettering
@server.feature(TEXT_DOCUMENT_COMPLETION)
def completions(params: CompletionParams) -> CompletionList:
    """Returnerar en lista med förslag under markören."""
    
    # Här kan du hålla det enkelt till en början med statiska nyckelord,
    # eller använda din Tree-sitter-parser för att leta efter deklarerade variabler!
    suggestions = [
        CompletionItem(label="FUNCTION_BLOCK"),
        CompletionItem(label="PROGRAM"),
        CompletionItem(label="VAR_INPUT"),
        CompletionItem(label="VAR_OUTPUT"),
        CompletionItem(label="END_VAR"),
    ]
    
    return CompletionList(is_incomplete=False, items=suggestions)

if __name__ == "__main__":
    # Kör servern över standard input/output (vilket Neovim förväntar sig)
    server.start_io()
