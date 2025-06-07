;;; -*- lexical-binding: t; -*-

(straight-use-package 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode 1)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c C-g") 'go-goto-imports)
            (local-set-key (kbd "C-c C-f") 'gofmt)
            (setq compile-command "go build -v && go test -v && go vet")))

(setq gofmt-command "goimports")
(setq go-packages-function 'go-packages-go-list)

;; lsp
(add-to-list 'exec-path (expand-file-name "~/go/bin"))
(setq straight-allow-recipe-inheritance nil)
(straight-use-package 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)


(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

;; Auto completion
(straight-use-package 'company)
(add-hook 'go-mode-hook #'company-mode)
(setq company-tooltip-limit 20)
(setq company-idle-delay 0.3)
(setq company-echo-delay 0)
(setq company-minimum-prefix-length 1)

;; flycheck
(straight-use-package 'flycheck)
(add-hook 'go-mode-hook #'flycheck-mode)
(setq flycheck-go-vet-command "go vet")
(setq flycheck-go-build-tags "integration")
(setq flycheck-go-errcheck-command "errcheck")

;; go test
;; (straight-use-package 'gotest)
;; (add-hook 'go-mode-hook #'gotest-mode)
;; (setq go-test-verbose t)

;; debug support
(straight-use-package 'dap-mode)
(require 'dap-dlv-go)
;; (dap-go-setup)

(provide 'init-go)
