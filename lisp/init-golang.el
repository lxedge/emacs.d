;;; init-golang.el --- Go language configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Go development setup using straight.el and eglot

;;; Code:

(repeat-mode 1)

(straight-use-package 'go-mode)
(straight-use-package 'go-eldoc)
(straight-use-package 'eglot)
(straight-use-package 'company)
(straight-use-package 'dape)

(defun set-go-env ()
  "Set GOPATH environment variable."
  (interactive)
  (let ((output (shell-command-to-string "go env GOPATH")))
    (setenv "GOPATH" (string-trim output))
    (setq exec-path (cons (concat (string-trim output) "/bin") exec-path))))

(defun find-go-project-root ()
  "Find the project root by looking for go.mod file."
  (let ((root (locate-dominating-file default-directory "go.mod")))
    (if root
        (expand-file-name root)
      default-directory)))

(defun set-company-for-go ()
  "set case insensitive completion for go mode"
  (setq-local company-dabbrev-ignore-case t)
  (setq-local company-dabbrev-downcase nil)
  (setq-local company-transformers '(company-sort-by-backend-importance)))

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
                   (concat "cd " (find-go-project-root) " && go build -v"))
              (set-company-for-go)
              (setq tab-width 4)))

  ;; Enable go-eldoc
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (set-face-attribute 'eldoc-highlight-function-argument nil
                      :underline t :foreground "green"
                      :weight 'bold)

  ;; Enable eglot in go-mode (only if gopls is installed)
  (when (executable-find "gopls")
    (add-hook 'go-mode-hook 'eglot-ensure))
  ;; Enable company-mode for completion
  (add-hook 'go-mode-hook 'company-mode)

  ;; Key bindings
  (define-key go-mode-map (kbd "C-c C-c") 'compile)
  (define-key go-mode-map (kbd "C-c C-r") 'eglot-rename)
  (define-key go-mode-map (kbd "C-c C-f") 'eglot-format-buffer)
  (define-key go-mode-map (kbd "C-c C-d") 'eglot-find-declaration)
  (define-key go-mode-map (kbd "C-c C-i") 'eglot-find-implementation)
  ;; dape debug keybindings
  (define-key go-mode-map (kbd "C-c d d") 'dape)
  (define-key go-mode-map (kbd "C-c d b") 'dape-breakpoint-toggle)
  (define-key go-mode-map (kbd "C-c d c") 'dape-continue)
  (define-key go-mode-map (kbd "C-c d n") 'dape-next)
  (define-key go-mode-map (kbd "C-c d s") 'dape-step-in)
  (define-key go-mode-map (kbd "C-c d o") 'dape-step-out)
  (define-key go-mode-map (kbd "C-c d q") 'dape-quit)
  (define-key go-mode-map (kbd "C-c d r") 'dape-repl)
  (define-key go-mode-map (kbd "C-c d w") 'dape-dwim))

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


;; Configure dape for Go debugging (requires dlv in PATH via Nix devShell + direnv)
(with-eval-after-load 'dape
  (add-to-list 'dape-configs
               `(dlv
                 modes (go-mode)
                 command "dlv"
                 command-args ("dap" "--listen" "127.0.0.1::autoport")
                 command-cwd dape-cwd-fn
                 host "127.0.0.1"
                 port :autoport
                 :type "go"
                 :request "launch"
                 :mode "debug"
                 :program dape-cwd-fn
                 :env (:CGO_CFLAGS "-U_FORTIFY_SOURCE")))
  (add-to-list 'dape-configs
               `(dlv-test
                 modes (go-mode)
                 command "dlv"
                 command-args ("dap" "--listen" "127.0.0.1::autoport")
                 command-cwd dape-cwd-fn
                 host "127.0.0.1"
                 port :autoport
                 :type "go"
                 :request "launch"
                 :mode "test"
                 :program dape-cwd-fn
                 :env (:CGO_CFLAGS "-U_FORTIFY_SOURCE")))

  ;; single-key repeat after C-c d <key>
  (defvar dape-repeat-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "n") #'dape-next)
      (define-key map (kbd "s") #'dape-step-in)
      (define-key map (kbd "o") #'dape-step-out)
      (define-key map (kbd "c") #'dape-continue)
      (define-key map (kbd "b") #'dape-breakpoint-toggle)
      (define-key map (kbd "q") #'dape-quit)
      (define-key map (kbd "r") #'dape-repl)
      (define-key map (kbd "w") #'dape-dwim))))


(provide 'init-golang)

;;; init-golang.el ends here
