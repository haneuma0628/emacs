;;; develop-common.el --- for programming        -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; common
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;; set [] as parenthesis
(modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)

;; flycheck
(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  ;; disable jshint since we prefer eslint checking
  (custom-set-variables
   '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))))

;; color
(use-package font-lock
  :init
  (global-font-lock-mode t))

;; eldoc
(use-package eldoc-mode
  :hook racer-mode)

;; <hoge>-mode
(use-package go-mode
  :mode "\\.go$")
(use-package scala-mode
  :mode "\\.scala$")
(use-package csharp-mode
  :mode "\\.cs$")
(use-package haskell-mode
  :mode ("\\.hs$" "\\.lhs$"))

(use-package yaml-mode
  :mode ("\\.yml$" "\\.yml.sample$" "\\.yml.erb$"))
(use-package haml-mode
  :mode "\\.haml$")
(use-package nxml-mode
  :mode ("\\.xml$" "\\.plist$"))

(use-package fish-mode
  :mode "\\.fis$")
(use-package dockerfile-mode
  :mode "Dockefile")

(use-package lisp-mode
  :mode "Cask")
(use-package javascript-mode
  :mode "\\.json.jinja2$")

(provide 'develop-common)
;;; develop-common.el ends here
