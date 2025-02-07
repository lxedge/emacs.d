;;; -*- lexical-binding: t; -*-

(straight-use-package 'gitlab-ci-mode)
(straight-use-package 'gitlab-ci-mode-flycheck)

(add-hook 'gitlab-ci-mode #'flycheck)
(add-hook 'gitlab-ci-mode #'gitlab-ci-mode-flycheck)


(provide 'init-gitlab-ci)
