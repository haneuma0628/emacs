;;; auto-complete-mode
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/site-lisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;; パッケージ管理 melpa
(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; 初期化
(package-initialize)

;;; キーバインド
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-x\C-c" 'query-replace)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(defalias 'exit 'save-buffers-kill-emacs)

;;; tabberの設定
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

;;; テンプレートの設定
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")

;; .htmlファイルのテンプレートをhtml-template.htmlに設定
(define-auto-insert "\\.html$" "html-template.html")
