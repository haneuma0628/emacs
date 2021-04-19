;;; package --- Summary
;;; Commentary:
;; init.el

;;; Code:

;; package
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; fix that cannot connect melpa, gnu
(load-library "url-handlers")

;; Cask
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;; pallet
(require 'pallet)
(pallet-mode t)

;; use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; conf
(add-to-list 'load-path "~/.emacs.d/conf")

; 各種設定(未分類)
(load "conf-common")
(load "conf-company")
(load "conf-parens")
(load "conf-search")
(load "conf-indent")
(load "conf-org")
(load "conf-doom")
; テンプレート
(load "template")
; キーバインド
(load "keybind")
; 見た目
(load "display")
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

;; Emacs customize
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
;;; init.el ends here
