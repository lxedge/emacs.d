;;

;; Using icomplete-vertical-mode instead.
;; (straight-use-package 'vertico)
;; (vertico-mode)
(setq completion-auto-help nil)

(icomplete-mode t)
(straight-use-package 'icomplete-vertical)
(icomplete-vertical-mode t)

(straight-use-package 'orderless)
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (style basic partial-completion)))
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

(straight-use-package 'marginalia)
(marginalia-mode t)

;; (straight-use-package 'consult)
;; (straight-use-package 'embark)
;; (straight-use-package 'embark-consult)


(provide 'init-mini)
