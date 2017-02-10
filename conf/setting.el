;;; pathを通す
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(dolist (dir (list
              "/usr/local/opt/cask"
              "/usr/texbin"
              "/usr/local/texlive/2015/bin/x86_64-darwin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin"))))


;;; 環境変数を読む
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; 言語
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; バックアップとオートセーブ
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;;; fix that cannot connect melpa, gnu
(load-library "url-handlers"
)


;;; tramp リモートでファイルをもごもごできる
(require 'tramp)
(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; hang対策のため、ssh先をbashで開く
