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
(set-frame-parameter (selected-frame) 'alpha '(88 88)) ; フレーム透過設定

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
; .HtmlファイルのテンプレートをHtml-Template.Htmlに設定
(define-auto-insert "\\.html$" "html-template.html")

;; for YaTex
;; YaTeX mode
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8")

;; use Skim to preview
(setq dvi2-command "/usr/bin/open -a Skim")

(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))

(setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/upbibtex")
                           ((string-match "platex" tex-command) "/usr/texbin/pbibtex")
                           ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/bibtexu")
                           ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/bibtex")
                           (t "/usr/texbin/pbibtex")))
(setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/mendex")
                              ((string-match "platex" tex-command) "/usr/texbin/mendex")
                              ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/texindy"
                              ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/makeindex")
                              (t "/usr/texbin/mendex"))))
(setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(defun skim-forward-search ()
  (interactive)
 (progn
    (process-kill-without-query
     (start-process
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
       (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))

(add-hook 'yatex-mode-hook
         '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;; RefTeX with YaTeX

(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; 何故かplatex等が使えなかったので(platex: command not foundとか表示される)pathを通す。
;; 必要なのは多分/usr/texbinだけだけど、コピペ元の設定をそのまま流用する。
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
;; PATH と exec-path に同じ物を追加します
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

;; load enviroment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; set eshell aliases
;(setq eshell-command-aliases-list
;      (append
;       (list
;        (list "desk" "cd ~/Desktop")
;        (list "swipl" "/opt/local/bin/swipl"))
;       eshell-command-aliases-list))
