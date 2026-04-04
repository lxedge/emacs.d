;;; -*- lexical-binding: t; -*-
;;; Code:

;; themes
(straight-use-package 'monokai-theme)
(straight-use-package 'zenburn-theme)
(straight-use-package 'solarized-theme)
(straight-use-package 'monochrome-theme)
(straight-use-package 'material-theme)
(straight-use-package 'doom-themes)
(straight-use-package 'vscode-dark-plus-theme)
(straight-use-package 'timu-caribbean-theme)

;; (load-theme 'monokai 1)
;; (load-theme 'zenburn 1)
;; (load-theme 'solarized-dark 1)
;; (load-theme 'monochrome 1)
;; (load-theme 'material t)
;; (load-theme 'doom-rouge t)
;; (load-theme 'vscode-dark-plus t)
(load-theme 'timu-caribbean t)

;; icons
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-dired)
(straight-use-package 'nerd-icons)
(straight-use-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq all-the-icons-dired-monochrome nil)

(provide 'init-theme)
;;; init-theme.el ends here
