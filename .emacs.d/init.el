(set-language-environment 'Japanese) ; 言語を日本語にする
(prefer-coding-system 'utf-8) ; 極力UTF-8とする

; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; load-path
(let((default-directory (expand-file-name "~/.emacs.d/site-lisp/")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

; フォント設定
;(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-face-attribute
 'default nil
 :family "Inconsolata"
 :height 160)

;; 日本語フォント設定
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 (font-spec :family "07やさしさゴシック" :size 14)
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

(setq-default show-trailing-whitespace t) ; 行末の空白を表示

(global-hl-line-mode) ; 現在行を目立たせる

(menu-bar-mode -1) ; メニューバーを消す
(tool-bar-mode -1) ; ツールバーを消す

(blink-cursor-mode 0) ; カーソルの点滅を止める
(show-paren-mode 1) ; 対応する括弧を光らせる
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる

; キーバインド
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region) ;指定した範囲をコメントアウト

; テンプレートの挿入
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
; .htmlファイルのテンプレートをhtml-template.htmlに設定
(define-auto-insert "\\.html$" "html-template.html")

; php-mode
(load-library "php-mode")
(require 'php-mode)
(global-font-lock-mode t)
(require 'font-lock)

(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))
(add-hook 'php-mode-user-hook
   '(lambda ()
      (setq tab-width 2)
      (setq indent-tabs-mode nil))
      (setq php-manual-path "/usr/local/share/php/doc/html")
      (setq php-manual-url "http://www.phppro.jp/phpmanual/")
)



; js2-mode
(load-library "js2-mode")
(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(put 'upcase-region 'disabled nil)

; haml-mode
(load-library "haml-mode")
(require 'haml-mode)
 (add-hook 'haml-mode-hook
               (lambda ()
                 (setq indent-tabs-mode nil)
                 (define-key haml-mode-map "\C-m" 'newline-and-indent)))

; yatex-mode
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

; pathを通す
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

;;バッファ全体の句読点と読点をコンマとピリオドに変換
(defun replace-commaperiod-buffer ()
  (interactive "r")
  (save-excursion
    (replace-string "、" "，" nil (point-min) (point-max))
    (replace-string "。" "．" nil (point-min) (point-max))))

;;選択範囲内の全角英数字を半角英数字に変換
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

;;バッファ全体の全角英数字を半角英数字に変換
(defun hankaku-eisuu-buffer ()
  (interactive)
  (hankaku-eisuu-region (point-min) (point-max)))

;;YaTeXモードの時にのみ動作させる用に条件分岐
(defun replace-commaperiod-before-save-if-needed ()
  (when (memq major-mode
              '(yatex-mode))
    (replace-commaperiod-buffer)(hankaku-eisuu-buffer)))

;;保存前フックに追加
(add-hook 'before-save-hook 'replace-commaperiod-before-save-if-needed)
