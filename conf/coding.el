(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))
(defun my-php-mode-hook ()
  "My hooks for php-mode"
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
  (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close))
(add-hook 'php-mode-hook 'my-php-mode-hook)


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
(add-to-list 'auto-mode-alist '("\\.js$"        . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))

(defun my-web-mode-hook ()
  "My hooks for web-mode"
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

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
(add-to-list 'auto-mode-alist '("\\.yml.sample$" . yaml-mode))


;;; ruby-mode
(require 'enh-ruby-mode)
(add-to-list 'auto-mode-alist'("\\.rb$" . enh-ruby-mode))

(defun my-ruby-mode-hook ()
  "My hooks for ruby-mode"
  (setq ruby-deep-indent-paren-style nil)
  (setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")
  (setq flycheck-checker 'ruby-rubocop)
  )
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
(push 'company-robe company-backends)


;;; python-mode
(defun my-python-mode-hook ()
  "My hooks for python-mode"
  (setq indent-tabs-mode nil)
  (setq python-indent-offset 4)
  )
(add-hook 'python-mode 'my-python-mode-hook)


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


;;; lisp
(add-to-list 'auto-mode-alist'("Cask" . lisp-mode))
