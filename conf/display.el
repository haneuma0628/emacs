;;; Emacsの見た目
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'my-misterious t)
(enable-theme 'my-misterious)

(set-frame-parameter (selected-frame) 'alpha '(75 90))

;;; いろいろ
(menu-bar-mode -1) ; メニューバーを消す
(tool-bar-mode -1) ; ツールバーを消す

(setq-default show-trailing-whitespace t) ; 文末の空白を表示
(setq-default line-spacing 3) ; 行間
(global-hl-line-mode t) ; 現在行を目立たせる

(blink-cursor-mode 0) ; カーソルの点滅を止める

(setq scroll-step 1) ; 1行ずつスクロール

;;; カッコ
(show-paren-mode 1) ; 対応する括弧を光らせる
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる

;; (require 'smartparens-config)
;; (smartparens-global-mode)
;; (ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
;; (ad-activate 'delete-backward-char)

;; カッコを虹色にシンタックスハイライト
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode t)

;;; 行番号の表示
(require 'linum)
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#35395c"
                    :height 0.9)
(setq linum-format "%3d ")

;;; 英語フォント設定
(set-face-attribute
 'default nil
 ;; :family "Inconsolata"
 :family "Ricty"
 :height 140
)

;;; 日本語フォント設定
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 (font-spec
  ;; :family "07やさしさゴシック"
  :family "Ricty"
  :size 14
  :height 18)
 )
