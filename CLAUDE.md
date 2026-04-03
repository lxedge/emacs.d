# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal Emacs configuration using [straight.el](https://github.com/radian-software/straight.el) for package management. There is no build step — changes take effect when Emacs is restarted or the relevant file is re-evaluated with `M-x eval-buffer` / `M-x load-file`.

## Structure

- `init.el` — Entry point. Bootstraps straight.el, adds `lisp/` to the load path, and `require`s each `init-*.el` module.
- `lisp/init-*.el` — One file per concern. Each file calls `straight-use-package` to declare its own dependencies, configures the packages, and ends with `(provide 'init-*)`.

Active modules (as of current `init.el`):

| Module | Purpose |
|---|---|
| `init-layout` | Vertico + vertico-prescient, marginalia, dired-sidebar, imenu-list, breadcrumb |
| `init-terminal` | vterm + multi-vterm with smart display logic |
| `init-theme` | timu-caribbean theme, Maple Mono NF CN font, icon packages |
| `init-company` | company-mode completion with child-frame focus fix for Wayland/tiling WMs |
| `init-edit` | paredit, direnv, ace-window, highlight-symbol, macOS meta key |
| `init-vcs` | magit |
| `init-eglot` | eglot, tree-sitter, tree-sitter-langs |
| `init-nix` | nix-mode |
| `init-yaml` | yaml-mode |
| `init-just` | justfile support |
| `init-rust` | rust-mode + rust-analyzer via eglot, cargo, flycheck, smartparens |
| `init-cpp` | C/C++ setup |
| `init-golang` | go-mode + gopls via eglot, goimports on save |
| `init-protobuf` | protobuf-mode |
| `init-clojure` | clojure-mode + CIDER + clojure-lsp via eglot, paredit |
| `init-elixir` | Elixir setup |
| `init-typescript` | typescript-mode + typescript-language-server via eglot, prettier-js |
| `init-web` | Web (HTML/CSS/JS) setup |

Commented-out modules in `init.el` (disabled but available): `init-corfu`, `init-bedit`, `init-kdl`, `init-llm`, `init-copilot`, `init-solidity`, `init-lua`.

## Adding a New Language or Feature

1. Create `lisp/init-<name>.el` with `;;; -*- lexical-binding: t; -*-` at the top.
2. Use `straight-use-package` inside the file to declare dependencies.
3. End with `(provide 'init-<name>)`.
4. Add `(require 'init-<name>)` to `init.el`.

## Key Conventions

- All files use `lexical-binding: t`.
- LSP is handled by **eglot** (not lsp-mode). Language modules call `(eglot-ensure)` in their mode hooks.
- Completion is via **company-mode** (`init-company`). The corfu alternative exists in `init-corfu.el` but is commented out.
- `straight.el` pins packages at `straight/repos/`. Do not manually edit files there.
- On Wayland/tiling WMs (Pop!_OS, COSMIC), child-frame focus stealing is mitigated in `init-company.el`.

## Package Management

Packages are managed exclusively via `straight-use-package` calls inside each `init-*.el`. There is no separate lockfile beyond what straight.el manages under `straight/`.

To update all packages: `M-x straight-pull-all` then restart Emacs.
