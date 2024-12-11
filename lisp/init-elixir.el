;;

;; (straight-use-package 'elixir-mode)
(straight-use-package 'elixir-ts-mode)

(require 'eglot)

(add-hook 'elixir-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(elixir-ts-mode "/home/miles/.emacs.d/language-server/elixir-ls/release/language_server.sh"))


(provide 'init-elixir)
