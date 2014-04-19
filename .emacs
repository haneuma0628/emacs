(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))

; php-mode
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

; js2-mode
(load-library "js2-mode")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(put 'upcase-region 'disabled nil)

; haml-mode
(load-library "haml-mode")
(require 'haml-mode)
 (add-hook 'haml-mode-hook
	   (lambda ()
	     (setq indent-tabs-mode nil)
	     (define-key haml-mode-map "\C-m" 'newline-and-indent)))
