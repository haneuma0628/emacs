;;; pathを通す
(dolist (dir (list
              "/usr/local/opt/cask"
              "/usr/texbin"
              "/usr/local/texlive/2015/bin/x86_64-darwin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              )))


;;; 環境変数を読む
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; fix that cannot connect melpa, gnu
(load-library "url-handlers")
