;;

;; (straight-use-package 'elixir-mode)
(straight-use-package 'elixir-ts-mode)

(add-hook 'elixir-ts-mode-hook 'lsp)

(provide 'init-elixir)
