;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'elixir-mode)
(straight-use-package 'alchemist)
(require 'eglot)

(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))
(add-to-list 'eglot-server-programs
             '(elixir-mode . ("elixir-ls")))

(add-hook 'elixir-ts-mode-hook #'eglot-ensure)
(add-hook 'elixir-ts-mode-hook
          (lambda ()
            (eglot-ensure)
            (setq-local indent-tabs-mode nil)
            (setq-local elixir-smie-indent-basic 2)))

(with-eval-after-load 'elixir-ts-mode-hook
  (setq alchemist-key-command-prefix (kbd "C-c ,")))

(provide 'init-elixir)

;;; init-elixir.el ends here
