;;;

(straight-use-package '(cargo :host github
                              :repo "DogLooksGood/cargo.el"))

(autoload 'cargo-minor-mode "cargo" nil t)
(add-hook 'rust-ts-mode-hook 'cargo-minor-mode)

(setq cargo-process--custom-path-to-bin nil
      cargo-process--rustc-cmd nil)

(straight-use-package 'rust-mode)
(straight-use-package 'rust-ts-mode)

(add-hook 'rust-ts-mode-hook
          (lambda ()
            (require 'rust-mode)
            (require 'rust-compile)))

(add-to-list 'auto-mode-alist (cons "\\.rs\\'" 'rust-ts-mode))

(setq lsp-rust-analyzer-completion-add-call-parenthesis nil
      lsp-rust-analyzer-proc-macro-enable t
      lsp-rust-analyzer-server-format-inlay-hints nil)


(provide 'init-rust)
