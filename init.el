;;; pathを通す
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/usr/texbin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  ;; PATH と exec-path に同じのを追加
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;;; 言語設定
(set-language-environment 'Japanese) ; 言語を日本語にする
(prefer-coding-system 'utf-8) ; 極力UTF-8とする

;;; load-path
;; load-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "site-lisp" "conf")
;; (let((default-directory (expand-file-name "~/.emacs.d/site-lisp/")))
;;   (add-to-list 'load-path default-directory)
;;   (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;       (normal-top-level-add-subdirs-to-load-path)))
;; (setq load-path (cons "~/.emacs.d/site-lisp/org/lsip" load-path))
;; (setq load-path (cons "~/.emacs.d/site-lisp/org/contrib/lisp" load-path))

;; (add-to-list 'load-path "~/.emacs.d/conf")

;;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; font-setting is load conf
(load "font")

;;; 色とか背景とか
(require 'color-theme)
(color-theme-initialize)
(color-theme-misterioso-custum)

(add-to-list 'default-frame-alist '(foreground-color . "white")) ; 文字の色を設定
(add-to-list 'default-frame-alist '(background-color . "#0a0d26")) ; 背景色を設定
(set-frame-parameter (selected-frame) 'alpha '(90 90)) ; フレーム透過設定

;; 対応する括弧を虹色でシンタックスハイライト
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode t)

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;; タブ幅の設定
(setq-default tab-width 8)

;; インデントにタブ文字を指定
;; (setq-default indent-tabs-mode t)
;; (setq default-indent-tabs-mode nil)

;; 現在行を目立たせる
(global-hl-line-mode)

(menu-bar-mode -1) ; メニューバーを消す
(tool-bar-mode -1) ; ツールバーを消す

(blink-cursor-mode 0) ; カーソルの点滅を止める
(show-paren-mode 1) ; 対応する括弧を光らせる
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる

;;; キーバインド
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-x\C-c" 'query-replace)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region) ; 指定した範囲をコメントアウト
;; I never use C-x C-c
(defalias 'exit 'save-buffers-kill-emacs)

;;; テンプレートの挿入
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
;; .htmlファイルのテンプレートをhtml-template.htmlに設定
(define-auto-insert "\\.html$" "html-template.html")

;;; melpa
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;;; for programming
(load "coding")

;;; auto-complete-mode
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/site-lisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;; for LaTeX
(load "yatex")

;;; tabber.el
(require 'tabbar)
(tabbar-mode 1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブ同士の間隔
(setq tabbar-separator '(1.5))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family (face-attribute 'default :family)
 :background (face-attribute 'mode-line-inactive :background)
 :height 0.9)
(set-face-attribute
 'tabbar-unselected nil
 :background (face-attribute 'mode-line-inactive :background)
 :foreground (face-attribute 'mode-line-inactive :foreground)
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background (face-attribute 'mode-line :background)
 :foreground (face-attribute 'mode-line :foreground)
 :box nil)
(defun get-color-helper (face attribute n diff)
  (format "%x" (max 0 (min (car (color-values "white"))
                           (+ diff (nth n (color-values (face-attribute face attribute))))))))
(defun create-color-helper (face attribute r g b)
  (concat "#"
          (get-color-helper face attribute 0 r)
          (get-color-helper face attribute 1 g)
          (get-color-helper face attribute 2 b)))
;; usage
(create-color-helper 'mode-line :foreground 10 -20 30)
;; キーに割り当てる
(global-set-key (kbd "s-<right>") 'tabbar-forward-tab)
(global-set-key (kbd "s-<left>") 'tabbar-backward-tab)
