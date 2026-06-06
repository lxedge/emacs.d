;;; init-kdl.el -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'kdl-mode)

(add-to-list 'auto-mode-alist '("\\.kdl\\'" . kdl-mode))

(defun kdl-format-buffer ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "kdlfmt format -" t t))

(add-hook 'kdl-mode-hook
          (lambda ()
            (setq tab-width 4)
            (local-set-key (kbd "C-c C-f") #'kdl-format-buffer)))

(provide 'init-kdl)

;;; init-kdl.el ends here
