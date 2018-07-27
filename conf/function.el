;;; 入力補完
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")


;;; 括弧補完
(require 'smartparens-config)
(smartparens-global-mode t)

;; 対応括弧の削除機能の無効化
(ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
(ad-activate 'delete-backward-char)


;;; ag + wgrep
;; ag
(require 'ag)
(setq default-process-coding-system 'utf-8-unix) ; ag 検索結果のエンコード指定
(setq ag-highlight-search t) ; 検索キーワードをハイライト
(setq ag-reuse-buffers t) ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

;; wgrep
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t) ; 編集完了と同時に保存
                           (setq wgrep-enable-key "r") ; "r" キーで編集モードに
                           (wgrep-ag-setup)))


;;; elnode
(require 'elnode)

;;; mongo
(require 'mongo)
