;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

(setq visible-bell 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)

(fset 'yes-or-no-p 'y-or-n-p)

;; (menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

(global-display-line-numbers-mode 1)
;; (global-hl-line-mode 1)
(global-auto-revert-mode 1)

(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)

(provide 'init-defaults)

;;; init-defaults.el ends here
