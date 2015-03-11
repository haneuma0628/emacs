(set-language-environment 'Japanese) ; 言語を日本語にする
(prefer-coding-system 'utf-8) ; 極力UTF-8とする

; load-path
(let((default-directory (expand-file-name "~/.emacs.d/site-lisp/")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(setq load-path (cons "~/.emacs.d/site-lisp/org/lsip" load-path))
(setq load-path (cons "~/.emacs.d/site-lisp/org/contrib/lisp" load-path))

;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; 英語フォント設定
(set-face-attribute
 'default nil
 :family "Inconsolata"
 :height 140
)

;; 日本語フォント設定
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 (font-spec
  :family "07やさしさゴシック"
  :size 14)
 )

;; 色とか背景とか
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

;; インデントにタブ文字を指定
(setq-default indent-tabs-mode t)
;;;(setq default-indent-tabs-mode nill)

;; タブ幅の設定
(setq-default tab-width 8)

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

;;; auto-complete-mode
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/site-lisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))
(add-hook 'php-mode-hook
	  (lambda ()
	    (c-set-style "bsd")
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'arglist-close 0)
	    (c-set-offset 'arglist-cont 0)

	    ;; arrayのインデント改善
	    (defun ywb-php-lineup-arglist-intro (langelem)
	      (save-excursion
		(goto-char (cdr langelem))
		(vector (+ (current-column) c-basic-offset))))
	    (defun ywb-php-lineup-arglist-close (langelem)
	      (save-excursion
		(goto-char (cdr langelem))
		(vector (current-column))))
	    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
	    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
	    ))

(global-font-lock-mode t)
(require 'font-lock)

;;; js2-mode
(load-library "js2-mode")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2
              tab-width 2
              indent-tabs-mode nil)
(add-hook 'js2-mode-hook
	  (lambda ()
))
(put 'upcase-region 'disabled nil)

;; haml-mode
;; (load-library "haml-mode")
;; (require 'haml-mode)
;; (add-hook 'haml-mode-hook
;; 	  (lambda ()
;; 	    (setq indent-tabs-mode nil)
;; 	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; web-mode
(require 'web-mode)
;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php$"       . web-mode))
;;; インデント数
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;; Associate an engine
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )

;; scala-mode2
(add-to-list 'load-path "/path/to/scala-mode2/")
(require 'scala-mode2)

;;; yatex-mode
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8")
(setq YaTeX-kanji-code 4)
(add-hook ' yatex-mode-hook
	    '(lambda () (auto-fill-mode -1))
	    )

;; バッファ全体の句読点と読点をコンマとピリオドに変換
(defun replace-commaperiod-buffer ()
  (interactive "r")
  (save-excursion
    (replace-string "、" "，" nil (point-min) (point-max))
    (replace-string "。" "．" nil (point-min) (point-max))))

;; 選択範囲内の全角英数字を半角英数字に変換
(defun hankaku-eisuu-region (start end)
  (interactive "r")
  (while (string-match
          "[０-９Ａ-Ｚａ-ｚ]+"
          (buffer-substring start end))
    (save-excursion
      (japanese-hankaku-region
       (+ start (match-beginning 0))
       (+ start (match-end 0))
       ))))

;; バッファ全体の全角英数字を半角英数字に変換
(defun hankaku-eisuu-buffer ()
  (interactive)
  (hankaku-eisuu-region (point-min) (point-max)))

;; YaTeXモードの時にのみ動作させる用に条件分岐
(defun replace-commaperiod-before-save-if-needed ()
  (when (memq major-mode
              '(yatex-mode))
    (replace-commaperiod-buffer)(hankaku-eisuu-buffer)))

;; 保存前フックに追加
(add-hook 'before-save-hook 'replace-commaperiod-before-save-if-needed)

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
