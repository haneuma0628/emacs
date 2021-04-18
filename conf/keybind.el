;;; package --- Summary
;;; Commentary:
;; モードによらないキーバインドを設定する

;;; Code:
;; なにかする
(bind-key "C-j" 'goto-line)
(bind-key "C-r" 'query-replace)
(bind-key "C-;" 'comment-or-uncomment-region)
(bind-key "C-t" 'other-window)
(bind-key "C-c a" 'align)
(bind-key "C-," 'beginning-of-buffer)
(bind-key "C-." 'end-of-buffer)

;; なにかしない
(bind-key "ESC ESC ESC" nil) ; 分割破壊阻止
(bind-key "\C-x \C-c" nil) ; C-x C-cでemacsをkillしない
(defalias 'exit 'save-buffers-kill-emacs) ; M-x exitでemacsをkill

;; ⌥キーを Meta キーとして利用する
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta))

(provide 'keybind)
;;; keybind.el ends here
