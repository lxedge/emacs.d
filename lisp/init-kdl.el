;;; init-golang.el -*- lexical-binding: t; -*-
;;;
;;; Code:

(straight-use-package 'kdl-mode)

(setq treesit-language-source-alist
      '((kdl "https://github.com/amaanq/tree-sitter-kdl")))

(treesit-install-language-grammar 'kdl)

(add-to-list 'auto-mode-alist '("\\.kdl\\'" . kdl-mode))

(add-hook 'kdl-mode-hook
          (lambda ()
            (setq tab-width 4)))


(provide 'init-kdl)

;;; init-golang.el ends here
