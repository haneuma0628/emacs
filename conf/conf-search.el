;;; config-search.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;; 検索に関する設定
;; ag, wgrep など
;;; Code:

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

(provide 'config-search)
;;; config-search.el ends here
