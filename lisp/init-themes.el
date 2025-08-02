;;; -*- lexical-binding: t; -*-
;;; Code:

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

(straight-use-package 'all-the-icons)
;; (straight-use-package 'treemacs)
;; (straight-use-package 'treemacs-all-the-icons)
;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; (treeamcs-load-theme "all-the-icons")

(provide 'init-themes)

;;; init-themes.el ends here
