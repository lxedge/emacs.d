;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'clojure-mode)
(straight-use-package 'cider)
(straight-use-package 'paredit)

(require 'eglot)
(require 'company)
(add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))

(add-hook 'clojurescript-mode-hook #'eglot-ensure)
(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (subword-mode)
            (eglot-ensure)
            (eldoc-mode)
            (company-mode)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-workspace-configuration
               '(:clojure-lsp . (:lint-as (clj-kondo/clojure-lsp
                                          clj-kondo/clojurescript
                                          clj-kondo/clojurec)))))

(setq eglot-extend-to-xref t)
(setq eglot-ignored-server-capabilities '(:documentHighlightProvider))

;; (straight-use-package 'lsp-mode)
;; (straight-use-package 'lsp-ui)
;; (straight-use-package 'company-lsp)

;; (require 'lsp-mode)
;; (require 'lsp-ui)
;; (require 'company-lsp)

;; (add-hook 'clojure-mode-hook #'lsp-deferred)
;; (add-hook 'clojure-mode-hook #'eldoc-mode)

;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

(setq clojure-toplevel-inside-comment-form t
      clojure-indent-style 'always-indent
      clojure-indent-keyword-style 'always-indent
      clojure-enable-indent-specs nil)


(provide 'init-clojure)

;;; init-clojure.el ends here
