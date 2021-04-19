;;; package --- Summary
;;; Commentary:
;; for Emacs customize http://ergoemacs.org/emacs/emacs_custom_system.html

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-disabled-checkers (quote (javascript-jshint javascript-jscs)))
 '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128")))
 '(package-selected-packages
   (quote
    (sql-indent ## flymake-python-pyflakes yaml-mode wgrep-ag web-mode use-package tabbar smex smartparens scala-mode rubocop rspec-mode robe rbenv rainbow-delimiters racer py-autopep8 projectile prodigy powerline popwin php-mode pallet org-preview-html org-plus-contrib nyan-mode neotree multiple-cursors mongo markdown-mode magit js2-mode js-auto-format-mode jinja2-mode jedi iflipb idle-highlight-mode htmlize hive highlight-indent-guides haskell-mode haml-mode git-gutter+ flycheck-rust flycheck-cask fish-mode expand-region exec-path-from-shell enh-ruby-mode elpy elnode drag-stuff dockerfile-mode csharp-mode creamsody-theme company-jedi annotate all-the-icons ag add-node-modules-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom)
;;; custom.el ends here
