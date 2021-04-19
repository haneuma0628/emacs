;;; config-common.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; pathを通す
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(dolist (dir (list
              "/bin"
              "/sbin"
              "/usr/local/bin"
              "/usr/local/sbin"
              "/usr/local/opt/cask"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin"))))

;; バックアップとオートセーブ
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; tramp リモートでファイルをもごもごできる
(use-package tramp
  :init
  (setq tramp-default-method "sshx")
  (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; hang対策のため、ssh先をbashで開く
)

;; common
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq ring-bell-function 'ignore)
(setq auto-window-vscroll nil)
;; refs https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; elnode - An evented IO webserver in Emacs Lisp.
(use-package elnode)

(provide 'config-common)
;;; config-common.el ends here
