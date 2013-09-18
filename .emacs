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

; mmm-mode in php
;(require 'mmm-mode)
;(setq mmm-global-mode 'maybe)
;(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;(mmm-add-classes
;   '((html-php
;   :submode php-mode
;   :front "<\\?\\(php\\)?"
;   :back "\\?>")))
;   (add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode)
;)
;; js in html
;(mmm-add-classes
; '((js-in-html
;    :submode javascript-mode
;    :front "<script[^>]*>\n<!--\n"
;    :back  "// ?-->\n</script>")))
;(mmm-add-mode-ext-class nil "\\.s?html?\\(\\..+\\)?$" 'js-in-html)

 ; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(put 'upcase-region 'disabled nil)
