(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "conf" ".cask" "my-lisp" "site-lisp")

(load "package")  ; package manager
(load "setting")  ; pathとか
(load "template") ; テンプレート
(load "keybind")  ; キーバインド
(load "function")  ; 追加機能
(load "display")  ; 見た目
(load "tab")  ; tabbar
(load "coding")  ; プログラミング言語
(load "edit")  ; 文書っぽいもの
