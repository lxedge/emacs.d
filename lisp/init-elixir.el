;;; -*- lexical-binding: t; -*-
;;

;; (straight-use-package 'elixir-mode)
(straight-use-package 'elixir-ts-mode)
(straight-use-package 'company-lsp)

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(add-hook 'elixir-ts-mode-hook #'lsp-deferred)

(with-eval-after-load 'elixir-ts-mode
  ;; (lsp-enable-which-key-integration t)
  (setq lsp-lens-enable t))

(lsp-register-client
 (make-lsp--client :new-connection (lsp-tramp-connection "elixir-ls")
		   :major-modes '(elixir-ts-mode)
		   :server-id 'elixir-ts))


(provide 'init-elixir)
