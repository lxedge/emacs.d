;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of List code."
  t)

(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(straight-use-package 'direnv)
(require 'direnv)
(direnv-mode)

(straight-use-package 'ace-window)
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
;; (straight-use-package 'which-key)
;; (require 'which-key)

(straight-use-package 'highlight-symbol)
(global-set-key (kbd "M-i") 'highlight-symbol)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; (straight-use-package 'fira-code-mode)
;; (add-hook 'prog-mode-hook 'fira-code-mode)
;; (global-fira-code-mode)

(set-face-attribute 'default nil :family "Fira Code")
(add-to-list 'default-frame-alist '(font . "Fira Code"))

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(set-frame-font "Fira Code" 'force-family)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-eval-after-load 'emacs-mac-port
              (select-frame frame)
              (mac-auto-operator-composition-mode 1))))

(defun my/font-size-from-resolution ()
  "Return font size based on current monitor resolution."
  (let* ((geom (frame-monitor-attribute 'geometry))
         (width (nth 2 geom)))
    (cond
     ;; 4K and above
     ((>= width 3840) 180)
     ;; 2K / 1440p
     ((>= width 2560) 150)
     ;; mac 1800
     ((>= width 1800) 140)
     ;; 1080p or smaller
     (t 130))))

(defun my/apply-font-size (&optional frame)
  "Apply font size for FRAME based on monitor resolution."
  (with-selected-frame (or frame (selected-frame))
    (set-face-attribute 'default nil :height (my/font-size-from-resolution))))

;; Run at startup
(my/apply-font-size)

;; Run whenever a new frame is created (GUI, daemon, etc.)
(add-hook 'after-make-frame-functions #'my/apply-font-size)


(provide 'init-edit)

;;; init-edit.el ends here
