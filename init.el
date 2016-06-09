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

(load "setting")  ; pathとか設定
(load "template") ; テンプレートの設定
(load "function") ; Emacsの機能
(load "display")  ; 見た目とか
(load "coding")   ; 各プログラミング言語に対する設定
(load "edit")     ; texとかevernoteとか
