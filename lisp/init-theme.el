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

;; font
;; (straight-use-package 'fira-code-mode)
;; (add-hook 'prog-mode-hook 'fira-code-mode)
;; (global-fira-code-mode)

(add-to-list 'default-frame-alist '(font . "Maple Mono NF CN"))

(set-face-attribute 'default nil
                    :family "Maple Mono NF CN"
                    :height 145
                    :weight 'regular)

(set-face-attribute 'font-lock-comment-face nil
                    :family "Maple Mono NF CN"
                    :slant 'italic)

(set-face-attribute 'font-lock-string-face nil
                    :family "Maple Mono NF CN"
                    :slant 'italic)

(set-face-attribute 'font-lock-keyword-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-function-name-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-function-call-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-type-face nil
                    :family "Maple Mono NF CN"
                    :weight 'bold
                    :slant 'normal)

(set-face-attribute 'font-lock-constant-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal)

(set-face-attribute 'font-lock-variable-name-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal)

(set-face-attribute 'font-lock-builtin-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal
                    :foreground "#569CD6")

(provide 'init-theme)

;;; init-theme.el ends here
