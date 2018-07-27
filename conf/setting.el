;;; add to path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(dolist (dir (list
              "/bin"
              "/sbin"
              "/usr/local/bin"
              "/usr/local/sbin"
              "/usr/local/opt/cask"
              "/usr/texbin"
              "/usr/local/texlive/2015/bin/x86_64-darwin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin"))))


;;; Environment variable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; rbenv
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "/usr/local/rbenv")


;;; Language and character code
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; Backup and auto-save
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;;; fix problm that cannot connect melpa, gnu
(load-library "url-handlers")


;;; tramp
(require 'tramp)
(setq tramp-default-method "sshx")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")) ; hang対策のため、ssh先をbashで開く
