;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'nix-mode)

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))


(provide 'init-nix)

;;; init-nix.el ends here
