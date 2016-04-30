;;; キーバインド
(bind-key "C-c C-g" 'goto-line)
(bind-key "C-c C-r" 'query-replace)
(bind-key "C-c C-a" 'align)
(bind-key "C-c a r" 'align-regexp)
(bind-key "C-c x;" 'comment-or-uncomment-region)
(bind-key "C-t" 'other-window)
(bind-key "ESC ESC ESC" nil) ; 分割破壊阻止
(bind-key "\C-x \C-c" nil) ; C-x C-cでemacsをkillしない
(defalias 'exit 'save-buffers-kill-emacs) ; M-x exitでemacsをkill


;;; company-mode(補完)
(require 'company)
(global-company-mode t)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)


;;; tramp リモートでファイルをもごもごできる
(require 'tramp)
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; ssh先をbashで開く。hang対策


;;; バックアップとオートセーブ
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))
