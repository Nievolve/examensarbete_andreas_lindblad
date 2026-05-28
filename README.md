# Neovim-konfiguration för Structured Text

## 1. Syfte

Den här konfigurationen installerar och använder en extern Tree-sitter-parser för Structured Text.

- Primärt repo: `examensarbete_andreas_lindblad`, branch `lsp`
- Tree-sitter-plugin: `nvim-treesitter`, branch `master`
- Textobjects-plugin: `nvim-treesitter-textobjects`, branch `master`
- Extern parser: `Nievolve/tree-sitter_ST`, branch `dev`
- Parsernamn och filetype: `st`

## 2. Installation

Öppna Neovim och kör:

```vim
:Lazy sync
:TSInstall st
```

Om parsern redan är installerad och ska byggas om:

```vim
:Lazy sync
:TSUpdate st
```

## 3. Kontroll

Verifiera att parsern är registrerad:

```vim
:lua print(vim.inspect(require("nvim-treesitter.parsers").get_parser_configs().st))
```

Verifiera installationen:

```vim
:TSInstallInfo
```

Öppna sedan en `.st`-fil och kontrollera:

```vim
:set filetype?
:TSBufEnable highlight
```

## 4. Krav

`nvim-treesitter` på branch `master` kräver Neovim 0.10 eller 0.11, C-kompilator och `tree-sitter-cli` upp till 0.25.x.

På Windows ska kompilatorn finnas i `PATH` innan `:TSInstall st` körs.

## 5. Viktigt

Highlight-queryn ägs av `tree-sitter_ST`-repot och ligger på:

```text
queries/st/highlights.scm
```

Nvim-konfigurationen laddar `tree-sitter_ST` som Lazy-dependency så att queryn finns på runtimepath.

De gamla lock-raderna för `nvim-treesitter` och `nvim-treesitter-textobjects` är borttagna från `lazy-lock.json`.
Efter `:Lazy sync` skrivs de tillbaka med rätt branch och commit.
