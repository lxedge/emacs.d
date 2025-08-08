;;; -*- lexical-binding: t; -*-
;;; Code:

(global-hl-line-mode t)
(setq-default cursor-type 'bar)

;; themes
(straight-use-package 'monokai-theme)
(straight-use-package 'zenburn-theme)
(straight-use-package 'solarized-theme)
(straight-use-package 'monochrome-theme)
(straight-use-package 'material-theme)
(straight-use-package 'doom-themes)
(straight-use-package 'vscode-dark-plus-theme)

;; (load-theme 'monokai 1)
;; (load-theme 'zenburn 1)
;; (load-theme 'solarized-dark 1)
;; (load-theme 'monochrome 1)
;; (load-theme 'material t)
;; (load-theme 'doom-rouge t)
(load-theme 'vscode-dark-plus t)

;; (straight-use-package 'treemacs)
;; (straight-use-package 'treemacs-all-the-icons)
;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; (treeamcs-load-theme "all-the-icons")

;; sidebar
(straight-use-package 'dired-sidebar)
(straight-use-package 'nerd-icons)
(straight-use-package 'nerd-icons-dired)
(setq dired-sidebar-theme 'nerd-icons)
(setq dired-sidebar-use-term-integration t)
(setq dired-sidebar-use-custom-font t)

;; breadcrumb
(straight-use-package 'breadcrumb)
(add-hook 'after-init-hook #'breadcrumb-mode)

(provide 'init-appearance)

;;; init-themes.el ends here
