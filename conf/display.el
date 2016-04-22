;;; Emacsの見た目
(load-theme 'wombat t)
(set-frame-parameter (selected-frame) 'alpha '(90 90))


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
(require 'cl-lib)
(require 'color)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(defun rainbow-delimiters-using-bright-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 16))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-bright-colors)


;;; 行番号の表示
(require 'linum)
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#125f5f"
                    :height 0.9)
(setq linum-format "%3d")


;;; フォント設定
(set-face-attribute
 'default nil
 :family "Ricty"
 :height 140
)


;;; highlight-indentation インデントをいい感じにハイライトしてくれる
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#353535")
(set-face-background 'highlight-indentation-current-column-face "#4c4c4c")
(add-hook 'prog-mode-hook 'highlight-indentation-mode)


;;; nyan-mode
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)

;;; タブエディタっぽくできる tabber
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
(global-set-key [C-tab] 'tabbar-forward-tab)
(global-set-key [C-S-tab] 'tabbar-backward-tab)
