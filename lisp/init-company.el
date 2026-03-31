;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'company)

(require 'company)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2
      company-tooltip-limit 10
      company-tooltip-align-annotations t
      company-require-match nil
      company-selection-wrap-around t
      company-dabbrev-other-buffers t
      company-dabbrev-ignore-case t
      company-dabbrev-downcase nil)

;; Keybindings
(global-set-key (kbd "C-.") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)

;; Backends
(setq company-backends
      '((company-capf
         company-dabbrev-code
         company-keywords
         company-files
         company-dabbrev)))

(add-hook 'after-init-hook 'global-company-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIX FOR POP!_OS / COSMIC FOCUS STEALING
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; On tiling window managers (like Pop Shell or COSMIC), child frames
;; used for completion popups can steal keyboard focus.
;; We must tell the Window Manager to ignore focus for these frames.

(with-eval-after-load 'company
  ;; If you use company-box (child frames), configure it to not accept focus.
  (when (featurep 'company-box)
    (setq company-box-frame-parameters
          (list (cons 'no-accept-focus t)
                (cons 'no-focus-on-map t)
                (cons 'desktop-dont-save t))))
  
  ;; Fix for standard company tooltip (if using pos-tip or similar external tips)
  ;; Standard company uses Emacs overlays by default which are usually safe.
  ;; But if you have `x-gtk-use-system-tooltips' nil or custom tooltip settings,
  ;; ensuring the frame parameters are correct is crucial.
  
  ;; General GTK/Window system setting to help with child frames
  (when (eq window-system 'x)
    ;; Prevents the tooltip/child frame from being focused by the WM
    (setq x-gtk-resize-child-frames 'resize-mode)))

(provide 'init-company)

;;; init-company.el ends here
