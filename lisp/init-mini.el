;;

;; Using icomplete-vertical-mode instead.
;; (straight-use-package 'vertico)
;; (vertico-mode)

(icomplete-mode 1)
(icomplete-vertical-mode 1)

(straight-use-package 'orderless)

(require 'orderless)

(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (style basic partial-completion))))

(straight-use-package 'marginalia)
(marginalia-mode)

;; (straight-use-package 'consult)
;; (straight-use-package 'embark)
;; (straight-use-package 'embark-consult)


(provide 'init-mini)
