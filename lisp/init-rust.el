;;; -*- lexical-binding: t; -*-

(straight-use-package 'rust-mode)
(straight-use-package '(cargo :host github
                              :repo "DogLooksGood/cargo.el"))
(straight-use-package 'flycheck)
(straight-use-package 'toml-mode)
(straight-use-package 'smartparens)

(require 'eglot)
(require 'cargo)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
(add-hook 'rust-mode-hook
          (lambda ()
            (prettify-symbols-mode)
            (eglot-ensure)
            (cargo-minor-mode)
            (flycheck-mode)
            (setq indent-tabs-mode nil)
            (tree-sitter-hl-mode)))

(with-eval-after-load 'rust-mode-hook
  (electric-indent-mode)
  (setq rust-indent-offset 4))


(provide 'init-rust)
