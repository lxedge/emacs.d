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

(require 'init-layout)
(require 'init-terminal)
(require 'init-theme)
;; (require 'init-company)
(require 'init-corfu)
(require 'init-edit)
;; (require 'init-bedit)
(require 'init-vcs)

(require 'init-eglot)
(require 'init-nix)
(require 'init-yaml)
(require 'init-just)
;; (require 'init-kdl)
;; (require 'init-llm)
;; (require 'init-copilot)

(require 'init-rust)
(require 'init-cpp)
(require 'init-golang)
(require 'init-protobuf)
(require 'init-clojure)
(require 'init-elixir)
(require 'init-typescript)
(require 'init-web)
;; (require 'init-solidity)
;; (require 'init-lua)

;; (require 'init-temp)
;; (require 'init-gitlab-ci)

;; (require 'init-telega)

;;; init.el ends here
