;;

(straight-use-package 'clojure-ts-mode)
(require 'clojure-ts-mode)

(straight-use-package 'cider)
(require 'cider)

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-ts-clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojure-ts-clojurec-mode))

(add-hook 'clojure-ts-mode-hook #'cider-mode)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'company-lsp)

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(add-hook 'clojure-ts-mode-hook #'lsp-deferred)
(add-hook 'cider-mode-hook #'eldoc-mode)

(lsp-register-client
 (make-lsp--client :new-connection (lsp-tramp-connection "clojure-lsp")
		   :major-modes '(clojure-ts-mode
				  clojure-ts-clojurescript-mode
				  clojure-ts-clojurec-mode)
		   :server-id 'clojure-ls))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)


(provide 'init-clojure)
