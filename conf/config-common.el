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

;; rbenv
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "/usr/local/rbenv")

;; 言語
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; バックアップとオートセーブ
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; fix that cannot connect melpa, gnu
(load-library "url-handlers"
)

;; tramp リモートでファイルをもごもごできる
(require 'tramp)
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; hang対策のため、ssh先をbashで開く

;; elnode - An evented IO webserver in Emacs Lisp.
(require 'elnode)

;; ビープ音を鳴らさない
(setq ring-bell-function 'ignore)

(provide 'config-common)
;;; config-common.el ends here
