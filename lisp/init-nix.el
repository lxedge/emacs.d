;;

(straight-use-package 'nix-ts-mode)
(require 'nix-ts-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))

(provide 'init-nix)
