# emacs.d

Personal Emacs configuration. Uses [straight.el](https://github.com/radian-software/straight.el) for reproducible package management. Modular structure — each concern lives in `lisp/init-*.el`.

## Requirements

- Emacs 29+
- **Font:** [Maple Mono NF CN](https://github.com/subframe7536/maple-font) (install system-wide before starting Emacs)
- Language servers installed on `$PATH` per language (see below)

## Installation

```sh
git clone <this-repo> ~/.emacs.d
emacs
```

straight.el bootstraps itself on first launch and installs all packages automatically.

## Language Support

| Language | LSP Server | Install |
|---|---|---|
| Rust | `rust-analyzer` | `rustup component add rust-analyzer` |
| Go | `gopls` | `go install golang.org/x/tools/gopls@latest` |
| TypeScript / TSX | `typescript-language-server` | `npm i -g typescript-language-server typescript` |
| C / C++ | `clangd` | `apt install clangd` / `brew install llvm` |
| Clojure | `clojure-lsp` | [clojure-lsp.io](https://clojure-lsp.io/installation/) |
| Elixir | `elixir-ls` | [github.com/elixir-lsp](https://github.com/elixir-lsp/elixir-ls) |

Go also requires `goimports` for format-on-save: `go install golang.org/x/tools/cmd/goimports@latest`

## Key Bindings

### Windows & Navigation

| Key | Action |
|---|---|
| `M-o` | Switch window (ace-window) |
| `M-[` / `M-]` | Shrink / enlarge window horizontally |
| `M--` / `M-=` | Shrink / enlarge window vertically |
| `C-'` | Toggle symbol outline sidebar (imenu-list) |

### Terminal

| Key | Action |
|---|---|
| `C-\`` | Toggle project vterm (opens/closes smart split) |
| `C-~` | New vterm |
| `C-c [` / `C-c ]` | Previous / next vterm |

### Completion

| Key | Action |
|---|---|
| `C-.` | Trigger company completion manually |
| `C-n` / `C-p` | Next / previous candidate (in popup) |
| `TAB` | Complete common prefix or cycle |
| `C-d` | Show documentation for candidate |

### Symbol Highlighting

| Key | Action |
|---|---|
| `M-i` | Highlight symbol at point |
| `M-n` / `M-p` | Jump to next / previous occurrence |

### Go (go-mode)

| Key | Action |
|---|---|
| `C-c C-c` | Compile (`go build -v`) |
| `C-c C-d` | Go to declaration |
| `C-c C-r` | Rename symbol |
| `C-c C-f` | Format buffer (gofmt/goimports) |

### C / C++ (cc-mode)

| Key | Action |
|---|---|
| `C-c C-c` | Compile (`make -k`) |

## Package Management

Packages are declared with `straight-use-package` inside each `lisp/init-*.el`. To update:

```
M-x straight-pull-all   ; pull latest for all packages
M-x straight-rebuild-all ; recompile if needed
```

Then restart Emacs.

To reload a single module without restarting:

```
M-x load-file RET ~/.emacs.d/lisp/init-<name>.el RET
```

## Notes

- **Wayland / tiling WMs (Pop!_OS, COSMIC):** `init-company.el` applies `no-accept-focus` to company child frames to prevent keyboard focus theft.
- **direnv** integration is active — `.envrc` files are picked up automatically when switching buffers.
- **macOS:** meta key is remapped to Cmd; Option is left as-is.
