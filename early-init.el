;;
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
(setq package-enable-at-startup nil)
(setq gc-cons-threshold (* 50 1024 1024))
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)

(setq visible-bell nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (setq initial-frame-alist
;;       '((width . 150) (height . 40)))
(setq frame-resize-pixelwise t)

(setq-default line-spacing 0.15)

;; (setq-default cursor-type 'box)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

(global-display-line-numbers-mode 1)
(global-hl-line-mode -1)
(global-auto-revert-mode 1)

;; disable warning from external packages.
(setq native-comp-async-report-warnings-errors nil)
(setq warning-minimum-level :error)
