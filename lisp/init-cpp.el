;;; -*- lexical-binding: t; -*-
;;; Code:

(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cxx\\'" . c++-mode))

(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode nil)))

(require 'eglot)
(with-eval-after-load 'cc-mode
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd" "--header-insertion=never")))
  (add-hook 'c-mode-hook #'eglot-ensure)
  (add-hook 'c++-mode-hook #'eglot-ensure)
  (setq compile-command "make -k")
  (define-key c-mode-base-map (kbd "C-c C-c") 'compile))


(provide 'init-cpp)
