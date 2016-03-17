(deftheme my-misterious
  "うちのテーマ")

(custom-theme-set-faces
 'my-misterious
 ;; 背景・文字・カーソル
 '(cursor ((t (:foreground "#0a0d26"))))
 '(default ((t (:background "#0a0d26" :foreground "#f8f8f2"))))

 ;; 選択範囲
 '(region ((t (:background "#35395c"))))

 ;; モードライン
 '(mode-line ((t (:foreground "#f8f8f2" :background "#0a0d26"
			      :box (:line-width 1 :color "#0a0d26" :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#0a0d26"
				       :box (:line-width 1 :color "#0a0d26")))))

 ;; ハイライト
 '(highlight ((t (:background "#212338"))));
 '(highlight-current-line ((t (:background "#212338"))));
 '(hl-line ((t (:background "#212338"))))

 ;; 関数名
 '(font-lock-function-name-face ((t (:foreground "#00ede1"))))

 ;; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#dbdb95"))))
 '(font-lock-string-face ((t (:foreground "#e67128"))))

 ;; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#ffad29" :weight bold))))

 ;; Boolean
 '(font-lock-constant-face((t (:foreground "#008b8b"))))

 ;; 括弧
 ;; (show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
 ;; (paren-face ((t (:foreground "#A6E22A" :background nil))))

 ;; コメント
 '(font-lock-comment-face ((t (:foreground "#747AAD"))))

 ;; CSS
 '(css-selector ((t (:foreground "#66D9EF"))))
 '(css-property ((t (:foreground "#FD971F"))))

 ;; nXML-mode
 ;; タグ名
 '(nxml-element-local-name ((t (:foreground "#F92672"))))
 ;; 属性
 '(nxml-attribute-local-name ((t (:foreground "#66D9EF"))))
 ;; 括弧
 '(nxml-tag-delimiter ((t (:foreground "#A6E22A"))))
 ;; DOCTYPE宣言
 '(nxml-markup-declaration-delimiter ((t (:foreground "#74715D"))))

 ;; dired
 '(dired-directory ((t (:foreground "#A6E22A"))))
 '(dired-symlink ((t (:foreground "#66D9EF"))))

 ;; MMM-mode
 '(mmm-default-submode-face ((t (:foreground nil :background "#000000"))))
 )

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'my-misterious)
