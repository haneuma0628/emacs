;;; package --- Summary
;;; Commentary:
;; init.el

;;; Code:
;; Cask
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;; pallet
(require 'pallet)
(pallet-mode t)

;; package
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; refs https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; 各ディレクトリにパスを通す
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "conf" ".cask" "site-lisp")

(setq auto-window-vscroll nil)

; 各種設定(未分類)
(load "config-common")
(load "conf-company")
(load "conf-parens")
(load "conf-search")
(load "conf-indent")
(load "conf-org")
; テンプレート
(load "template")
; キーバインド
(load "keybind")
; 見た目
(load "display")
(load "display-doom")
; for develop
(load "develop-common")
(load "develop-php")
(load "develop-javascript")
(load "develop-web")
(load "develop-ruby")
(load "develop-rust")
(load "develop-octave")
(load "develop-hive")
; 文書っぽいもの
(load "edit-common")
(load "edit-yatex")
(load "edit-markdown")

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

(provide 'init)
;;; init.el ends here
