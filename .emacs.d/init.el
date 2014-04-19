(set-language-environment 'Japanese) ; 言語を日本語にする
(prefer-coding-system 'utf-8) ; 極力UTF-8とする

; フォント設定
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic Pro" :size 14)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))

(add-to-list 'default-frame-alist '(foreground-color . "white")) ; 文字の色を設定
(add-to-list 'default-frame-alist '(background-color . "#222222")) ; 背景色を設定
(set-frame-parameter (selected-frame) 'alpha '(85 85)) ; フレーム透過設定

(menu-bar-mode -1) ; メニューバーを消す
(tool-bar-mode -1) ; ツールバーを消す

(blink-cursor-mode 0) ; カーソルの点滅を止める
(show-paren-mode 1) ; 対応する括弧を光らせる
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる

(setq-default show-trailing-whitespace t) ; 行末の空白を表示

(global-hl-line-mode) ; 現在行を目立たせる

; テンプレートの挿入
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
; .htmlファイルのテンプレートをhtml-template.htmlに設定
(define-auto-insert "\\.html$" "html-template.html")

; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))
