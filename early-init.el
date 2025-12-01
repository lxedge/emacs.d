;;
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

(setq package-enable-at-startup nil)

(setq initial-frame-alist
      '((width . 150) (height . 40)))

(setq gc-cons-threshold (* 50 1024 1024))

(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)
