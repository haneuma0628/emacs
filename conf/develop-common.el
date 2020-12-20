;;; develop-common.el --- for programming        -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set [] as parenthesis
(modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)

;; color
(require 'font-lock)
(global-font-lock-mode t)

;; require
(require 'fish-mode)
(require 'scala-mode)
(require 'csharp-mode)
(require 'haskell-mode)
(require 'yaml-mode)
(require 'haml-mode)
(require 'nxml-mode)
(require 'dockerfile-mode)
(require 'mongo)

;; add-to-list
(add-to-list 'auto-mode-alist'("\\.cs$" . csharp-mode))
(add-to-list 'auto-mode-alist'("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist'("\\.lhs$" . haskell-mode))
(add-to-list 'auto-mode-alist'("Cask" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.json.jinja2$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml.sample$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml.erb$" . yaml-mode))
(add-to-list 'auto-mode-alist'("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist'("\\.plist$" . nxml-mode))
(add-to-list 'auto-mode-alist'("\\.xml$" . nxml-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'develop-common)
;;; develop-common.el ends here
