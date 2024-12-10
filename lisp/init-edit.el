;;
(straight-use-package 'company)
;; (require 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)

(straight-use-package 'company-box)
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(straight-use-package 'company-lsp)
(require 'company-lsp)
(push 'company-lsp company-backends)

(straight-use-package 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of List code."
  t)

;; (add-hook 'M-mode-hook 'enable-paredit-mode)

(provide 'init-edit)
