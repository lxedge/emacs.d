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

;; (straight-use-package 'fira-code-mode)
;; (add-hook 'prog-mode-hook 'fira-code-mode)
;; (global-fira-code-mode)

(set-face-attribute 'default nil :family "Fira Code" :height 130)
(add-to-list 'default-frame-alist '(font . "Fira Code 10"))

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(set-frame-font "Fira Code 10" 'force-family)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-eval-after-load 'emacs-mac-port
              (select-frame frame)
              (mac-auto-operator-composition-mode 1))))

(provide 'init-edit)

;;; init-edit.el ends here
