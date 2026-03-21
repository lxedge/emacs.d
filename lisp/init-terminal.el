;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'vterm)
(straight-use-package 'multi-vterm)

(setq vterm-kill-buffer-on-exit t)
(setq confirm-kill-processes nil)
(setq vterm-max-scrollback 10000)
(setq vterm-ignore-blink-cursor t)

(setq vterm-shell (or (executable-find "zsh")
                      (executable-find "bash")
                      "/bin/sh"))

(add-hook 'vterm-mode-hook
          (lambda ()
            (setq-local global-hl-line-mode nil)
            (setq-local confirm-kill-processes nil)
            (setq-local kill-buffer-query-functions nil)
            (display-line-numbers-mode -1)))

(defun lxedge/vterm-display-buffer (buf alist)
  (let* ((windows (window-list))
         (window-count (length windows)))
    (cond
     ((= window-count 1)
      (let ((win (split-window-right (floor (* (frame-width) -0.4)))))
        (set-window-buffer win buf)
        win))

     ((= window-count 2)
      (let* ((rightmost (car (sort windows
                                   (lambda (a b)
                                     (> (car (window-edges a))
                                        (car (window-edges b)))))))
             (win (split-window rightmost nil 'below)))
        (set-window-buffer win buf)
        win))

     ;; fallback：直接在当前窗口显示
     (t
      (set-window-buffer (selected-window) buf)
      (selected-window)))))

(add-to-list 'display-buffer-alist
             '((lambda (buf _)
                 (with-current-buffer buf
                   (eq major-mode 'vterm-mode)))
               (lxedge/vterm-display-buffer)))

(defun lxedge/multi-vterm-project-toggle ()
  "Toggle vterm for current project in selected window."
  (interactive)
  (if (seq-find (lambda (win)
                  (with-current-buffer (window-buffer win)
                    (eq major-mode 'vterm-mode)))
                (window-list))
      (winner-undo)
    (multi-vterm-project)))


(global-set-key (kbd "C-`") #'lxedge/multi-vterm-project-toggle)
(global-set-key (kbd "C-~") #'multi-vterm)
(global-set-key (kbd "C-c [") #'multi-vterm-prev)
(global-set-key (kbd "C-c ]") #'multi-vterm-next)


(provide 'init-terminal)

;;; init-terminal.el ends here
