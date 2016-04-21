;;; pathを通す
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/usr/local/opt/cask"
              "/usr/texbin"
              "/usr/local/texlive/2015/bin/x86_64-darwin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  ;; PATH と exec-path に同じのを追加
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))


;;; 環境変数を読む
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))


;;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; trampの設定
(require 'tramp)
(setq tramp-default-method "scpx")
