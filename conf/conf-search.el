;;; conf-search.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;; ag, wgrep など、検索に関する設定を記述する。

;;; Code:

;; ag
(use-package ag
  :init
  (setq default-process-coding-system 'utf-8-unix)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t))

;; wgrep
(use-package wgrep-ag
  :hook (ag-mode . wgrep-ag-setup)
  :init
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-enable-key "r"))

(provide 'config-search)
;;; conf-search.el ends here
