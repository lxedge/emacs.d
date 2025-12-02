;;; ;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package '(telega :type git :host github :repo "zevlg/telega.el"))

(require 'telega)

(setq telega-server-libs-prefix "/opt/homebrew/opt/tdlib")

;; (setq telega-symbols-emojify t)
;; (setq telega-emoji-use-images t)
;; (setq telega-inline-images t)
;; (setq telega-photo-show-original t)
;; (setq telega-chat-fill-column 72)
;; (setq telega-chat-show-avatars t)
;; (setq telega-cache-dir (expand-file-name "~/.telega/cache"))
;; (setq telega-root-default-view '(all-chats :sort-by 'last-message))
;; (telega-notifications-mode 1)


(provide 'init-telega)
