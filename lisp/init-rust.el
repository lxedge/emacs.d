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
            (eglot-ensure)
            (cargo-minor-mode)
            (flycheck-mode)
            (setq indent-tabs-mode nil)
            (local-set-key (kbd "C-c C-c") 'rust-run)
            (tree-sitter-hl-mode)))

(with-eval-after-load 'rust-mode-hook
  (electric-indent-mode)
  (setq rust-indent-offset 4))

;; (autoload 'cargo-minor-mode "cargo" nil t)
;; (add-hook 'rust-ts-mode-hook 'cargo-minor-mode)

;; (setq cargo-process--custom-path-to-bin nil
;;       cargo-process--rustc-cmd nil)

;; (straight-use-package 'rust-mode)

;; (add-hook 'rust-ts-mode-hook
;;           (lambda ()
;;             (require 'rust-mode)
;;             (require 'rust-compile)
;; 	    (require 'lsp-mode)
;; 	    (require 'lsp-ui)
;; 	    (require 'company-lsp)))

;; (add-hook 'rust-ts-mode #'lsp-deferred)
;; ;; (add-hook 'before-save-hook #'lsp-format-buffer)

;; (add-to-list 'auto-mode-alist (cons "\\.rs\\'" 'rust-ts-mode))

;; (setq lsp-rust-analyzer-completion-add-call-parenthesis nil
;;       lsp-rust-analyzer-proc-macro-enable t
;;       lsp-rust-analyzer-server-format-inlay-hints nil
;;       lsp-rust-analyzer-standalone-file-support t)


(provide 'init-rust)
