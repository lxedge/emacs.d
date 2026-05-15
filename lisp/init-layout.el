;;; -*- lexical-binding: t; -*-
;;; Code:

(winner-mode 1)
(global-set-key (kbd "M-[") #'shrink-window-horizontally)
(global-set-key (kbd "M-]") #'enlarge-window-horizontally)
(global-set-key (kbd "M--") #'shrink-window)
(global-set-key (kbd "M-=") #'enlarge-window)

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
(straight-use-package 'dirvish)
(dirvish-override-dired-mode)
(global-set-key (kbd "C-x d") #'dirvish-side)
(when (eq system-type 'darwin)
  (setq insert-directory-program "gls"))
(setq dired-listing-switches "-alh --group-directories-first")
;; UI
(setq dirvish-use-header-line t)
(setq dirvish-use-mode-line nil)
(setq dirvish-side-width 35)
;; preview
(dirvish-peek-mode)
;; 自动跟随当前文件
(dirvish-side-follow-mode)
(with-eval-after-load 'dirvish
  (define-key dirvish-mode-map (kbd "TAB") #'dirvish-subtree-toggle)
  (define-key dirvish-mode-map (kbd "f") #'dirvish-file-info-menu)
  (define-key dirvish-mode-map (kbd "y") #'dirvish-yank-menu)
  (define-key dirvish-mode-map (kbd "/") #'dirvish-fd)
  (define-key dirvish-mode-map (kbd "h") #'dired-up-directory)
  (define-key dirvish-mode-map (kbd "l") #'dired-find-file))

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
