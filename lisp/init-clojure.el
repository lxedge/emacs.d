;;

(straight-use-package 'clojure-mode)
;; (require 'clojure-ts-mode)

(straight-use-package 'cider)

;; (add-hook 'clojure-mode-hook #'cider-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'company-lsp)

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(add-hook 'clojure-mode-hook #'lsp-deferred)
(add-hook 'clojure-mode-hook #'eldoc-mode)

'(lsp-register-client
 (make-lsp--client :new-connection (lsp-tramp-connection "clojure-lsp")
		   :major-modes '(clojure-ts-mode
				  clojure-ts-clojurescript-mode
				  clojure-ts-clojurec-mode)
		   :server-id 'clojure-ls))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(setq clojure-toplevel-inside-comment-form t
      clojure-indent-style 'always-indent
      clojure-indent-keyword-style 'always-indent
      clojure-enable-indent-specs nil)


(provide 'init-clojure)
