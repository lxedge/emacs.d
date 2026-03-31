;;; init-corfu.el --- Modern in-buffer completion with Corfu -*- lexical-binding: t; -*-
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dependencies
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Core completion UI
(straight-use-package 'corfu)

;; Fuzzy matching style
(straight-use-package 'orderless)

;; Completion At Point Extensions
(straight-use-package 'cape)

;; Icons for completion candidates
(straight-use-package 'kind-icon)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Orderless Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use orderless for flexible pattern matching
;; It splits the input string into components and matches them in any order
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles basic partial-completion))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Corfu Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable Corfu globally
(global-corfu-mode 1)

;; Cycle through candidates
(setq corfu-cycle t
      corfu-auto t
      corfu-auto-delay 0.1
      corfu-auto-prefix 2
      corfu-scroll-margin 5
      corfu-min-width 80
      corfu-max-width 100
      corfu-preselect 'prompt
      corfu-on-exact-match nil)

;; Enable indentation + completion via TAB
(setq tab-always-indent 'complete)

;; Popup info (Documentation)
;; This shows documentation for the selected candidate in a popup
(require 'corfu-popupinfo)
(corfu-popupinfo-mode 1)
(setq corfu-popupinfo-delay '(0.5 . 0.2))

;; Icons configuration
(setq kind-icon-default-face 'corfu-default)
(setq kind-icon-blend-background nil)
(add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cape Configuration (Extensions)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add completion backends (Cape)
;; These provide completions from different sources

;; File completion
(add-to-list 'completion-at-point-functions #'cape-file)
;; Keyword completion (dabbrev-like, but better)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
;; Line completion (history)
(add-to-list 'completion-at-point-functions #'cape-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key corfu-map (kbd "TAB") 'corfu-next)
(define-key corfu-map [tab] 'corfu-next)
(define-key corfu-map (kbd "S-TAB") 'corfu-previous)
(define-key corfu-map [backtab] 'corfu-previous)
(define-key corfu-map (kbd "M-RET") 'corfu-insert)
(define-key corfu-map (kbd "M-SPC") 'corfu-insert-separator)

(provide 'init-corfu)

;;; init-corfu.el ends here
