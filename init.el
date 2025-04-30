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
	 "https://radian-software.github.io/straight.el/install.el"
         ;; "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(add-to-list 'load-path "~/.emacs.d/lisp")


(require 'init-defaults)
(require 'init-themes)
(require 'init-mini)
(require 'init-edit)
(require 'init-lsp)
(require 'init-nix)
(require 'init-llm)

(require 'init-elixir)
(require 'init-clojure)
(require 'init-rust)
(require 'init-proto)
(require 'init-gitlab-ci)

;;; init.el ends here
