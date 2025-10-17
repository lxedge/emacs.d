;;; -*- lexical-binding: t; -*-
;;; Code:

(setq visible-bell nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-defaults)

;;; init-defaults.el ends here
