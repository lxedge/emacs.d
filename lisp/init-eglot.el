;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 2
      company-idle-delay 0.5
      company-selection-wrap-around t
      company-tooltip-limit 10
      company-show-quick-access 'left)

(add-hook 'prog-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-capf
                    company-files
                    company-keywords
                    company-dabbrev-code)))))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'company-backends 'company-capf))

(straight-use-package 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(setq company-tooltip-align-annotations t
      company-box-icons-alist 'company-box-icons-all-the-icons
      company-tooltip-flip-when-above t
      company-frontends
      '(company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

;; lsp section
(straight-use-package 'eglot)
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)


(provide 'init-eglot)
