;;; パッケージ管理
;; Cask
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;; package
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))


;;; 各ディレクトリにパスを通す
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "conf" ".cask" "my-lisp" "site-lisp")

(load "setting")  ; pathとか
(load "template") ; テンプレート
(load "keybind")  ; キーバインド
(load "function") ; 追加機能
(load "display")  ; 見た目
(load "coding")   ; プログラミング言語
(load "edit")     ; 文書っぽいもの
