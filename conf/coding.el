;;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))

(add-hook 'php-mode-hook
          (lambda ()

            ;; use tab-indent
            (setq indent-tabs-mode t)
            (setq tab-width 8)

            ;; setting indent-style
            (c-set-style "bsd")
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'arglist-close 0)
            (c-set-offset 'arglist-cont 0)

            ;; improve array-indent
            (defun ywb-php-lineup-arglist-intro (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (+ (current-column) c-basic-offset))))
            (defun ywb-php-lineup-arglist-close (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (current-column))))
            (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
            (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
            ))

;; 色
(global-font-lock-mode t)
(require 'font-lock)

;;; js2-mode
(load-library "js2-mode")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2
              tab-width 2
              indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)

;;; haml-mode
;; (load-library "haml-mode")
;; (require 'haml-mode)
;; (add-hook 'haml-mode-hook
;; 	  (lambda ()
;; 	    (setq indent-tabs-mode nil)
;; 	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;;; web-mode
(require 'web-mode)

;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php$"       . web-mode))

;; インデント数
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; web-modeにhighlight-indentation-modeをhookする
(require 'highlight-indentation)
(add-hook 'web-mode-hook 'highlight-indentation-mode)
(add-hook 'web-mode-hook 'highlight-indentation-current-column-mode)

;; Associate an engine
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )

;;; scala-mode2
(add-to-list 'load-path "/path/to/scala-mode2/")
(require 'scala-mode2)
