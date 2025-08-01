;;; package --- Summary
;;; Commentary:
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
	 ;; "https://radian-software.github.io/straight.el/install.el"
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'package)
(straight-use-package 'external-completion)
(straight-use-package 'project)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-defaults)
(require 'init-themes)
(require 'init-mini)
(require 'init-edit)

(require 'init-nix)
(require 'init-llm)

(require 'init-eglot)
(require 'init-rust)
;; (require 'init-go)
(require 'init-typescript)
(require 'init-clojure)
(require 'init-elixir)
;; (require 'init-temp)
;; (require 'init-proto)
;; (require 'init-gitlab-ci)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("53b6ea82cb4aa7547d3667b5a007638ff4a2bf877883e440ff3acd82e7bbdabc"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
