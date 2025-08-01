;;; -*- lexical-binding: t; -*-
;;;

(straight-use-package 'typescript-mode)
(straight-use-package 'prettier-js)
(require 'eglot)

(add-to-list 'auto-mode-alist (cons "\\.ts\\'" 'typescript-mode))
(add-to-list 'auto-mode-alist (cons "\\.tsx\\'" 'typescript-tsx-mode))

(add-to-list 'eglot-server-programs
             '((typescript-mode typescript-tsx-mode)
               . ("typescript-language-server" "--stdio")))

(add-hook 'typescript-mode-hook #'eglot-ensure)
(add-hook 'typescript-tsx-mode-hook #'eglot-ensure)

(add-hook 'typescript-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)
            (setq-local typescript-indent-level 4)
            (prettier-js-mode)))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-workspace-configuration
;;                '(:typescript . (:preferences
;;                                 (:includeCompletionsForModuleExports t
;;                                  :includeCompletionsWithInsertText t)
;;                                 ))))


(provide 'init-typescript)
