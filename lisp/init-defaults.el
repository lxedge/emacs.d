;;; -*- lexical-binding: t; -*-
;;; Code:

(setq visible-bell nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq frame-resize-pixelwise t)

(set-face-attribute 'default nil :family "Fira Code" :height 140)
(add-to-list 'default-frame-alist '(font . "Fira Code-14"))

(provide 'init-defaults)

;;; init-defaults.el ends here
