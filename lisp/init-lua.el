;;; init-lua.el --- Lua language configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Lua development setup using straight.el and eglot

;;; Code:

(straight-use-package 'lua-mode)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(setq lua-indent-level 2
      lua-fontify-non-standard-types t)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(lua-mode . ("lua-language-server"))))

(defun my/lua-format ()
  (interactive)
  (when (eq major-mode 'lua-mode)
    (shell-command-on-region
     (point-min) (point-max)
     "stylua -" (current-buffer) t)))

(add-hook 'lua-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-f") #'my/lua-format)))

(provide 'init-lua)


;;; init-lua.el ends here
