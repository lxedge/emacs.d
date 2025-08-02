;;; -*- lexical-binding: t; -*-
;;; Code:

(straight-use-package 'gptel)

(setq gptel-model 'deepseek-chat
      gptel-backend
      (gptel-make-openai "DeepSeek"
        :host "api.deepseek.com/v1"
        :endpoint "/chat/completions"
        :stream t
        :key (shell-command-to-string "echo $AI_DEEPSEEK_API_KEY")
        :models '(deepseek-chat deepseek-coder)))

(provide 'init-llm)


;;; init-llm.el ends here
