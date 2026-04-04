;;; -*- lexical-binding: t; -*-
;;; Code:

(add-to-list 'default-frame-alist '(font . "Maple Mono NF CN"))

(set-face-attribute 'default nil
                    :family "Maple Mono NF CN"
                    :height 145
                    :weight 'regular)

(set-face-attribute 'font-lock-comment-face nil
                    :family "Maple Mono NF CN"
                    :slant 'italic)

(set-face-attribute 'font-lock-string-face nil
                    :family "Maple Mono NF CN"
                    :slant 'italic)

(set-face-attribute 'font-lock-keyword-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-function-name-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-function-call-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'italic)

(set-face-attribute 'font-lock-type-face nil
                    :family "Maple Mono NF CN"
                    :weight 'bold
                    :slant 'normal)

(set-face-attribute 'font-lock-constant-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal)

(set-face-attribute 'font-lock-variable-name-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal)

(set-face-attribute 'font-lock-builtin-face nil
                    :family "Maple Mono NF CN"
                    :weight 'regular
                    :slant 'normal
                    :foreground "#569CD6")

(provide 'maple-mono)
