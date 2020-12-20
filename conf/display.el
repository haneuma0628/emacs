;;; package --- Summary:
;;; Commentary:
;;; 表示まわりの設定いろいろ
;; - font
;; - theme
;; - 細かい設定
;; - show-paren-mode
;; - rainbow-delimiters
;; - linum
;; - powerline
;; - iflipb
;; - neotree
;;; Code:
;; font
(set-face-attribute
 'default nil
 :family "Fira Code"
 :weight 'light
 :height 120
 )

;; themes
(load-theme 'creamsody t)

;; いろいろ
(set-frame-parameter (selected-frame) 'alpha '(90 90)) ; ウィンドウを透過
(menu-bar-mode -1) ; メニューバーを消す
(tool-bar-mode -1) ; ツールバーを消す
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq-default show-trailing-whitespace t) ; 文末の空白を表示
(setq-default line-spacing 3) ; 行間
(global-hl-line-mode t) ; 現在行を目立たせる
(blink-cursor-mode 0) ; カーソルの点滅を止める
(setq scroll-step 1) ; 1行ずつスクロールva
(require 'all-the-icons)

;; 行番号の表示
(require 'linum)
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#125f5f"
                    :height 0.9)
(setq linum-format "%3d")

;; モードラインをシュッとする
(require 'powerline)
(powerline-default-theme)

;; iflipb
(require 'iflipb)
(setq iflipb-ignore-buffers (list "^[*]" "^magit" "]$" "^\*Flymake" "^\*epc" "\*Compile"))
(setq iflipb-wrap-around t)
(bind-key "C-<tab>" 'iflipb-next-buffer)
(bind-key "C-<S-tab>" 'iflipb-previous-buffer)

;; ディレクトリツリーを表示
(require 'neotree)
(global-set-key (kbd "C-x t") 'neotree-toggle)
(setq neo-show-hidden-files t)
(setq neo-window-fixed-size nil)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


(provide 'display)
;;; display.el ends here
