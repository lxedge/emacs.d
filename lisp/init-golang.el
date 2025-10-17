;;; init-golang.el --- Go language configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Go development setup using straight.el and eglot

;;; Code:

(straight-use-package 'go-mode)
;; (straight-use-package 'go-eldoc)
(straight-use-package 'eglot)
(straight-use-package 'company)

(defun set-go-env ()
  "Set GOPATH environment variable."
  (interactive)
  (let ((output (shell-command-to-string "go env GOPATH")))
    (setenv "GOPATH" (string-trim output))
    (setq exec-path (cons (concat (string-trim output) "/bin") exec-path))))

(defun go-project-root ()
  "Find the project root by looking for go.mod file."
  (let ((root (locate-dominating-file default-directory "go.mod")))
    (if root
        (expand-file-name root)
      default-directory)))

;; Configure go-mode
(with-eval-after-load 'go-mode
  (set-go-env)
  ;; Set gofmt command and format on save
  (setq gofmt-command "goimports")
  (setq compile-command "go build -v && go vet")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command)
                   (concat "cd " (go-project-root) " && go build -v"))))

  ;; Enable go-eldoc
  ;; (add-hook 'go-mode-hook 'go-eldoc-setup)
  ;; (set-face-attribute 'eldoc-highlight-function-argument nil
  ;;                     :underline t :foreground "green"
  ;;                     :weight 'bold)

  ;; Enable eglot in go-mode
  (add-hook 'go-mode-hook 'eglot-ensure)
  ;; Enable company-mode for completion
  (add-hook 'go-mode-hook 'company-mode)

  ;; Key bindings
  (define-key go-mode-map (kbd "C-c C-c") 'compile)
  (define-key go-mode-map (kbd "C-c C-d") 'eglot-find-declaration)
  (define-key go-mode-map (kbd "C-c C-r") 'eglot-rename)
  (define-key go-mode-map (kbd "C-c C-f") 'eglot-format-buffer))

;; Configure eglot for Go
(with-eval-after-load 'eglot
  ;; Add gopls configuration
  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls")))

  ;; Optional: Configure gopls settings
  (setq-default eglot-workspace-configuration
                '(:gopls (:staticcheck t
                          :usePlaceholders t
                          :completeUnimported t
                          :analyses (:unusedparams t
                                     :shadow t)))))

;; Configure company-mode
(with-eval-after-load 'company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

(provide 'init-golang)

;;; init-golang.el ends here
