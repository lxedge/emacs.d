;;

(straight-use-package 'clojure-ts-mode)
(straight-use-package 'cider)

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojure-ts-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)


(provide 'init-clojure)
