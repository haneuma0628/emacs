;;; パッケージ管理 - Cask
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;;; パッケージ管理 - package
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))


;;; キーバインド
(bind-key "\C-cg" 'goto-line)
(bind-key "\C-cr" 'query-replace)
(bind-key (kbd "C-c ;") 'comment-or-uncomment-region)
(bind-key "\C-x\C-c" nil) ; C-x C-cでemacsをkillしない
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


;;; テンプレートの設定
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")

;; ;; .htmlファイルのテンプレートをhtml-template.htmlに設定
;; (define-auto-insert "\\.html$" "html-template.html")
