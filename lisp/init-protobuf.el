;; Protocol Buffer (protobuf) configuration for Emacs
;; Using straight.el

;; Install protobuf-mode
(straight-use-package 'protobuf-mode)

;; Basic protobuf-mode setup
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; Set indentation to 2 spaces (Google style)
(add-hook 'protobuf-mode-hook
          (lambda ()
            (setq c-basic-offset 2)))

;; Enhanced syntax highlighting
(add-hook 'protobuf-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
              '(("\\<\\(message\\|service\\|rpc\\|returns\\|enum\\|oneof\\|map\\|repeated\\|optional\\|required\\)\\>" . font-lock-keyword-face)))))

;; Optional: Eglot for LSP support
(straight-use-package 'eglot)

;; Register protobuf language server
;; Install bufls: go install github.com/bufbuild/buf-language-server/cmd/bufls@latest
;; Or protols: npm install -g protols
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(protobuf-mode . ("bufls" "serve")))

  ;; Alternative: use protols instead
  ;; (add-to-list 'eglot-server-programs
  ;;              '(protobuf-mode . ("protols")))

  ;; Eglot settings
  (setq eglot-autoshutdown t
        eglot-sync-connect nil))

;; Enable eglot for protobuf files
(add-hook 'protobuf-mode-hook 'eglot-ensure)

;; Optional: Company mode for autocompletion
(straight-use-package 'company)
(add-hook 'protobuf-mode-hook 'company-mode)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

;; Optional: Flycheck for syntax checking
(straight-use-package 'flycheck)
(add-hook 'protobuf-mode-hook 'flycheck-mode)

;; Define protobuf syntax checker (requires protoc in PATH)
(with-eval-after-load 'flycheck
  (flycheck-define-checker protobuf-protoc
    "A protobuf syntax checker using protoc."
    :command ("protoc" "--error_format=gcc"
              "-I" (eval (file-name-directory (buffer-file-name)))
              (eval (buffer-file-name)))
    :error-patterns
    ((error line-start (file-name) ":" line ":" column ": " (message) line-end))
    :modes protobuf-mode)
  (add-to-list 'flycheck-checkers 'protobuf-protoc))

;; Optional: clang-format for formatting
;; (straight-use-package 'clang-format)

;; Auto-format on save (requires clang-format binary)
;; (when (executable-find "clang-format")
;;   (add-hook 'protobuf-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'clang-format-buffer nil 'local))))

;; (setq clang-format-style "google")

;; Keybindings
(with-eval-after-load 'protobuf-mode
  (define-key protobuf-mode-map (kbd "C-c C-f") 'clang-format-buffer)
  (define-key protobuf-mode-map (kbd "C-c C-r") 'clang-format-region)
  (define-key protobuf-mode-map (kbd "C-c C-e") 'eglot-reconnect))

(provide 'init-protobuf)
