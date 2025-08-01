;;; -*- lexical-binding: t; -*-
;;;

(straight-use-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'eglot-server-programs
             '(web-mode . ("vscode-html-language-server" "--stdio")))
(add-hook 'web-mode-hook #'eglot-ensure)

(with-eval-after-load 'web-mode
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t)
  (define-key web-mode-map (kbd "C-c C-f") 'web-mode-indent-butter))


(provide 'init-web)
