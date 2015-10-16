;;; 各ディレクトリにパスを通す
;; load-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "site-lisp" "elpa" "conf" "themes")

(load "setting") ; pathとか設定
(load "template") ; テンプレートの設定
(load "function") ; Emacsの機能
(load "display") ; 見た目とか
(load "coding") ; 各プログラミング言語に対する設定
(load "yatex") ; てふてふ
