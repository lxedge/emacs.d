;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'nix-ts-mode)
(require 'nix-ts-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))

(provide 'init-nix)

;;; init-nix.el ends here
