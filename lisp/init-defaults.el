;;

(setq visible-bell 1)
(setq make-backup-files nil)
(setq auto-save-default nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; (menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)

(delete-selection-mode 1)


(provide 'init-defaults)
