;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'protobuf-mode)

(defconst my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook (lambda () (c-add-style "my-style" my-protobuf-style t)))

(provide 'init-proto)

;;; init-proto.el ends here
