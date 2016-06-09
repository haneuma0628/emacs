;;; キーバインド
(bind-key "C-j" 'goto-line)
(bind-key "C-r" 'query-replace)
(bind-key "C-;" 'comment-or-uncomment-region)
(bind-key "C-t" 'other-window)
(bind-key "C-c a" 'align)
(bind-key "ESC ESC ESC" nil) ; 分割破壊阻止
(bind-key "\C-x \C-c" nil) ; C-x C-cでemacsをkillしない
(defalias 'exit 'save-buffers-kill-emacs) ; M-x exitでemacsをkill


;;; company-mode(補完)
(require 'company)
(global-company-mode t)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)


;;; tramp リモートでファイルをもごもごできる
(require 'tramp)
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; ssh先をbashで開く。hang対策


;;; バックアップとオートセーブ
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;;; ag + wgrep
;; ag
(require 'ag)
(setq default-process-coding-system 'utf-8-unix) ; ag 検索結果のエンコード指定
(setq ag-highlight-search t) ; 検索キーワードをハイライト
(setq ag-reuse-buffers t) ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

;; wgrep
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t) ; 編集完了と同時に保存
                           (setq wgrep-enable-key "r") ; "r" キーで編集モードに
                           (wgrep-ag-setup)))


;;; elnode
(require 'elnode)
