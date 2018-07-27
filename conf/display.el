;;; フォント設定
(set-face-attribute
 'default nil
 :family "Fira Code"
 :weight 'light
 :height 120
 )

;;; いろいろ
(load-theme 'wombat t)
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
(setq scroll-step 1) ; 1行ずつスクロール


;;; 対の括弧を強調
(show-paren-mode 1)
(setq show-paren-style 'mixed)


;;; カッコを虹色にシンタックスハイライトする
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)


;;; インデントの強調
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'fill)
(setq highlight-indent-guides-auto-odd-face-perc 10)
(setq highlight-indent-guides-auto-even-face-perc 5)


;;; 行番号の表示
(require 'linum)
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#125f5f"
                    :height 0.9)
(setq linum-format "%3d")


;;; nyan-mode
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)


;;; モードラインをシュッとする
(require 'powerline)
(powerline-default-theme)


;;; ディレクトリツリーを表示
(setq neo-show-hidden-files t)
(global-set-key (kbd "C-x t") 'neotree-toggle)
