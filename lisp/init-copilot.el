;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'copilot)
(straight-use-package 'copilot-chat)
(require 'copilot)
(require 'copilot-chat)

(with-eval-after-load 'copilot
  (add-hook 'prog-mode-hook 'copilot-mode)
  (setq copilot-indent-offset-warning-disable t)
  (setq copilot-idle-delay 1)
  (setq copilot-max-completions 3)
  (setq copilot-enable-predicates
        '(copilot-predicate-frontend-visible
          copilot-predicate-buffer-not-in-comment
          copilot-predicate-after-char
          copilot-predicate-indent-line-beg
          copilot-predicate-major-mode
          copilot-predicate-not-in-string))

  ;; Keybindings for copilot
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word)
  (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
  (define-key copilot-completion-map (kbd "C-n") 'copilot-next-completion)
  (define-key copilot-completion-map (kbd "C-p") 'copilot-previous-completion))


(provide 'init-copilot)

;;; init-copilot.el ends here
