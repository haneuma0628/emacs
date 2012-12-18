(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))

; php-mod
(load-library "php-mode")
(require 'php-mode)

(global-font-lock-mode t)
(require 'font-lock)

(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))
(add-hook 'php-mode-user-hook
   '(lambda ()
      (setq tab-width 2)
      (setq indent-tabs-mode nil))
      (setq php-manual-path "/usr/local/share/php/doc/html")
      (setq php-manual-url "http://www.phppro.jp/phpmanual/")
)