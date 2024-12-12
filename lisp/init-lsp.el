;;

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'lsp-ui)

(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(straight-use-package 'treesit-auto)

;; List of supported major modes.
;; tree-sitter-major-mode-language-alist

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(require 'treesit-auto)
(global-treesit-auto-mode)
(setq treesit-auto-langs
      '(bash clojure css elixir heex html javascript typescript json nix rust yaml python sql))
(setq treesit-auto-install t)
(treesit-auto-install-all)


(provide 'init-lsp)