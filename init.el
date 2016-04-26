;;; 各ディレクトリにパスを通す

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "conf" ".cask")

(load "setting") ; pathとか設定
(load "template") ; テンプレートの設定
(load "function") ; Emacsの機能
(load "display") ; 見た目とか
(load "coding") ; 各プログラミング言語に対する設定
(load "edit") ; texとかevernoteとか
