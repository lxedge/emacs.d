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

;; (let ((default-directory (locate-user-emacs-file "lisp/")))
;;   (normal-top-level-add-to-load-path '("."))
;;   (normal-top-level-add-subdirs-to-load-path))

(require 'init-font)
(require 'init-layout)
(require 'init-theme)
(require 'init-terminal)
(require 'init-company)
;; (require 'init-corfu)
(require 'init-edit)
;; (require 'init-bedit)
(require 'init-vcs)

(require 'init-eglot)
(require 'init-nix)
(require 'init-yaml)
(require 'init-just)
;; (require 'init-kdl)

(require 'init-clojure)
(require 'init-elixir)
(require 'init-golang)
(require 'init-protobuf)
(require 'init-rust)
(require 'init-typescript)
(require 'init-web)
(require 'init-cpp)

(require 'init-move)
;; (require 'init-solidity)
;; (require 'init-lua)

(require 'init-claude)
;; (require 'init-llm)
;; (require 'init-copilot)
