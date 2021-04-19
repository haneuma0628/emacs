;;; develop-ruby.el ---                          -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:
;; Ruby
(require 'enh-ruby-mode)
(require 'robe)
(add-to-list 'auto-mode-alist'("\\.rb$" . enh-ruby-mode))

(defun my-ruby-mode-hook ()
  "My hooks for enh-ruby-mode."
  (setq enh-ruby-deep-indent-paren nil)
  (setq flycheck-checker 'ruby-rubocop)
  (setq flycheck-rubocoprc ".rubocop.yml")
  (setq flycheck-disabled-checkers '(ruby-rubylint))
  ; (robe-mode)
  )
(add-hook 'enh-ruby-mode-hook 'my-ruby-mode-hook)
(push 'company-robe company-backends)

;; rbenv
(use-package rbenv
  :init
  (global-rbenv-mode)
  (setq rbenv-installation-dir "/usr/local/rbenv")
)

(provide 'develop-ruby)
;;; develop-ruby.el ends here
