;;; -*- lexical-binding: t; -*-

(straight-use-package 'solidity-mode)
(straight-use-package 'solidity-flycheck)
(straight-use-package 'company-solidity)

(require 'eglot)

;; Requires: npm install -g @nomicfoundation/solidity-language-server
(add-to-list 'eglot-server-programs
             '(solidity-mode . ("nomicfoundation-solidity-language-server" "--stdio")))

(with-eval-after-load 'solidity-mode
  (require 'solidity-flycheck)
  (setq solidity-flycheck-solc-checker-active t)

  (add-hook 'solidity-mode-hook
            (lambda ()
              (eglot-ensure)
              (flycheck-mode 1)
              (company-mode 1)
              (add-to-list 'company-backends 'company-solidity))))

(provide 'init-solidity)
