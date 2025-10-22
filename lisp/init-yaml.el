;;; ;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'yaml-mode)
(straight-use-package 'highlight-indentation)

(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
          (lambda ()
            ;; Set indentation to 2 spaces (YAML standard)
            (setq yaml-indent-offset 2)
            ;; Highlight indentation (helps with YAML structure)
            (highlight-indentation-mode)
            ;; Enable electric pair mode for quotes and brackets
            (electric-pair-local-mode 1)))

(provide 'init-yaml)
