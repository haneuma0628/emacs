;;;フォント設定
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
