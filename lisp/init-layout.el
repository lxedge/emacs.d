;;; -*- lexical-binding: t; -*-
;;; Code:

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; minibar ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using icomplete-vertical-mode instead.
;; (straight-use-package 'vertico)
;; (vertico-mode)
;; (setq completion-auto-help nil)

(straight-use-package 'marginalia)
(marginalia-mode t)

;; (straight-use-package 'consult)
;; (straight-use-package 'embark)
;; (straight-use-package 'embark-consult)

(straight-use-package '(vertico :files (:defaults "extensions/*")))
(straight-use-package 'prescient)
(straight-use-package 'vertico-prescient)

(require 'vertico)
(require 'vertico-prescient)

(vertico-mode 1)
(vertico-prescient-mode 1)
(prescient-persist-mode 1)

;; install all-the-icons
(straight-use-package 'all-the-icons)
(unless (member "all-the-icons" (font-family-list))
  (all-the-icons-install-fonts t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; sidebar-left ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'dired-sidebar)
(setq dired-sidebar-theme 'nerd-icons)
(setq dired-sidebar-use-term-integration t)
(setq dired-sidebar-use-custom-font t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; sidebar-right ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'imenu-list)
(require 'imenu-list)
(setq imenu-list-focus-after-activation t)
(setq imenu-list-auto-resize t)
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; breadcrumb ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'breadcrumb)
(add-hook 'after-init-hook #'breadcrumb-mode)

(provide 'init-layout)

;;; init-layout.el ends here
