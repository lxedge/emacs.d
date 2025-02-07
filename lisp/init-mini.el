;;; -*- lexical-binding: t; -*-
;;

;; Using icomplete-vertical-mode instead.
;; (straight-use-package 'vertico)
;; (vertico-mode)
;; (setq completion-auto-help nil)

(straight-use-package 'marginalia)
(marginalia-mode t)

;; (straight-use-package 'consult)
;; (straight-use-package 'embark)
;; (straight-use-package 'embark-consult)

(straight-use-package '(vertico :files (:defaults "extensions/*")))
(straight-use-package 'prescient)
(straight-use-package 'vertico-prescient)

(require 'vertico)
(require 'vertico-prescient)

(vertico-mode 1)
(vertico-prescient-mode 1)
(prescient-persist-mode 1)


(provide 'init-mini)
