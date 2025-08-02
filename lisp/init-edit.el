;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of List code."
  t)

(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(straight-use-package 'direnv)
(require 'direnv)
(direnv-mode)

(straight-use-package 'ace-window)
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
;; (straight-use-package 'which-key)
;; (require 'which-key)

(straight-use-package 'highlight-symbol)
(global-set-key (kbd "M-i") 'highlight-symbol)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(provide 'init-edit)

;;; init-edit.el ends here
