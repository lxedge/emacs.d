;;; just-mode configuration using straight.el

;; Install just-mode using straight.el
(straight-use-package 'just-mode)

;; Basic just-mode configuration
(with-eval-after-load 'just-mode
  ;; Enable just-mode for Justfiles
  (add-to-list 'auto-mode-alist '("/[Jj]ustfile\\'" . just-mode))
  (add-to-list 'auto-mode-alist '("\\.[Jj]ust\\(file\\)?\\'" . just-mode))

  ;; Set indentation to 4 spaces (just's default)
  (setq just-indent-offset 4)

  ;; Enable syntax highlighting
  (setq font-lock-maximum-decoration t)

  ;; Optional: Set executable path if just is not in PATH
  ;; (setq just-executable "/usr/local/bin/just")

  ;; Optional: Enable automatic indentation
  (add-hook 'just-mode-hook
            (lambda ()
              (setq-local indent-tabs-mode nil)
              (setq-local tab-width 4)))

  ;; Optional: Keybindings for just-mode
  (define-key just-mode-map (kbd "C-c C-c") 'just-mode-exec-recipe-in-dir)
  (define-key just-mode-map (kbd "C-c C-e") 'just-mode-exec-recipe)
  (define-key just-mode-map (kbd "C-c C-l") 'just-mode-list-recipes))

(provide 'init-just)
