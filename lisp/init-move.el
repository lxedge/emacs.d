;;; init-move.el --- Move language configuration for Sui blockchain -*- lexical-binding: t; -*-

;;; Commentary:
;; Move smart contract development setup using straight.el and eglot.
;; Requires move-analyzer in PATH (install via: cargo install --git
;; https://github.com/move-language/move move-analyzer --branch main)
;; or via Sui CLI: sui move build installs toolchain dependencies.

;;; Code:

(straight-use-package 'move-mode)
(straight-use-package 'eglot)
(straight-use-package 'company)
(straight-use-package 'flycheck)

(require 'eglot)

;; Associate .move files with move-mode
(add-to-list 'auto-mode-alist '("\\.move\\'" . move-mode))

(defun find-move-project-root ()
  "Find Move project root by locating Move.toml."
  (let ((root (locate-dominating-file default-directory "Move.toml")))
    (if root
        (expand-file-name root)
      default-directory)))

(defun move-build ()
  "Run sui move build at project root."
  (interactive)
  (let ((default-directory (find-move-project-root)))
    (compile "sui move build")))

(defun move-test ()
  "Run sui move test at project root."
  (interactive)
  (let ((default-directory (find-move-project-root)))
    (compile "sui move test")))

(defun move-format-buffer ()
  "Format the current Move buffer using sui move fmt."
  (interactive)
  (when (and (derived-mode-p 'move-mode)
             (executable-find "sui"))
    (let ((buf (current-buffer))
          (file (buffer-file-name)))
      (when file
        (save-buffer)
        (shell-command (format "sui move fmt %s" (shell-quote-argument file)))
        (revert-buffer t t t)))))

;; Register move-analyzer with eglot
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(move-mode . ("move-analyzer"))))

;; Configure move-mode hook
(add-hook 'move-mode-hook
          (lambda ()
            (company-mode 1)
            (flycheck-mode 1)
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode nil)
            (set (make-local-variable 'compile-command)
                 (concat "cd " (find-move-project-root) " && sui move build"))
            (when (executable-find "move-analyzer")
              (eglot-ensure))))

;; Key bindings via move-mode-map (available after move-mode loads)
(with-eval-after-load 'move-mode
  (define-key move-mode-map (kbd "C-c C-c") #'move-build)
  (define-key move-mode-map (kbd "C-c C-t") #'move-test)
  (define-key move-mode-map (kbd "C-c C-f") #'move-format-buffer)
  (define-key move-mode-map (kbd "C-c C-r") #'eglot-rename)
  (define-key move-mode-map (kbd "C-c C-d") #'eglot-find-declaration)
  (define-key move-mode-map (kbd "C-c C-i") #'eglot-find-implementation))

;; Company settings for Move
(with-eval-after-load 'company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

(provide 'init-move)

;;; init-move.el ends here
