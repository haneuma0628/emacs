;;; php-mode
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

            (smart-paren-mode)
            ))

;; 色
(global-font-lock-mode t)
(require 'font-lock)


;;; c-mode
(require 'fish-mode)


;;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2
              tab-width 2
              indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)


;;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; web-modeにhighlight-indentation-modeをhookする
;; (add-hook 'web-mode-hook 'highlight-indentation-mode)
;; (add-hook 'web-mode-hook 'highlight-indentation-current-column-mode)

;; Associate an engine
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )


;;; scala-mode2
(require 'scala-mode)


;;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;;; ruby-mode
(defun my-ruby-mode-hook ()
  "Hooks for Ruby mode."
  (setq ruby-deep-indent-paren-style nil)
  ;; (smart-paren-mode)
  (smartparens-mode))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;;; python-mode
(add-hook 'python-mode-hook
          (function (lambda ()
                      (smartparens-mode)
                      (setq indent-tabs-mode t)
                      (setq python-indent-offset 8)
                      (flycheck-mode 1))))
;; (put 'set-goal-column 'disabled nil);

;;; csharp-mode
(require 'csharp-mode)
(add-to-list 'auto-mode-alist'("\\.cs$" . csharp-mode))


;;; haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist'("\\.haml$" . haml-mode))


;;; octave-mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
    (cons '("\\.m$" . octave-mode)auto-mode-alist))
(add-hook 'octave-mode-hook
      (lambda ()
        (abbrev-mode 1)
        (auto-fill-mode 1)
        (if (eq window-system 'x)
            (font-lock-mode 1))))


;;; haskell
(require 'haskell-mode)
(add-to-list 'auto-mode-alist'("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist'("\\.lhs$" . haskell-mode))


;;; xml
(require 'nxml-mode)
(add-to-list 'auto-mode-alist'("\\.plist$" . nxml-mode))
(add-to-list 'auto-mode-alist'("\\.xml$" . nxml-mode))
