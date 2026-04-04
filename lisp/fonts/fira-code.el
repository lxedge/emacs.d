;;; -*- lexical-binding: t; -*-
;;; Code:

;; Set Fira Code as the default font
(set-frame-font "Fira Code-12" nil t)
(add-to-list 'default-frame-alist '(font . "Fira Code-12"))

;; Use ligature.el for ligature support (HARFBUZZ/Cairo rendering)
(straight-use-package
 '(ligature :type git :host github :repo "mickeynp/ligature.el"))

(require 'ligature)

;; From https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
(ligature-set-ligatures 't '("www"))
(ligature-set-ligatures 'prog-mode
  '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
    "{-" "::" ":::" ":=" "!!" "!=" "!==" "-}"
    "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
    "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
    ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
    "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
    "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
    "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
    ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
    "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
    "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
    "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"))

(global-ligature-mode t)

(provide 'fira-code)
