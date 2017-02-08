;;; キーバインド
(bind-key "C-j" 'goto-line)
(bind-key "C-r" 'query-replace)
(bind-key "C-;" 'comment-or-uncomment-region)
(bind-key "C-t" 'other-window)
(bind-key "C-c a" 'align)
(bind-key "C-<" 'beginning-of-buffer)
(bind-key "C->" 'end-of-buffer)
(bind-key "ESC ESC ESC" nil) ; 分割破壊阻止
(bind-key "\C-x \C-c" nil) ; C-x C-cでemacsをkillしない
(defalias 'exit 'save-buffers-kill-emacs) ; M-x exitでemacsをkill
