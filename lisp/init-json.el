;;; -*- lexical-binding: t; -*-
;;

(straight-use-package 'json-mode)

(add-hook 'json-mode-hook
	  (lambda ()
	    (setq js-indent-level 2)))

(provide 'init-json)
