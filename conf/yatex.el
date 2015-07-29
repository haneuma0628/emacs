;; yatex-mode
(add-to-list 'auto-mode-alist '("\\.tex$" . yatex-mode))
(add-to-list 'auto-mode-alist '("\\.lxt$" . yatex-mode))
(add-to-list 'auto-mode-alist '("\\.cls$" . yatex-mode))
(add-to-list 'auto-mode-alist '("\\.sty$" . yatex-mode))
(add-to-list 'auto-mode-alist '("\\.clo$" . yatex-mode))
(add-to-list 'auto-mode-alist '("\\.bbl$" . yatex-mode))

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
