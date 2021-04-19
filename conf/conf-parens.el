;;; conf-parens.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; かっこを補完する
(require 'smartparens-config)
(smartparens-global-mode t)

;; 対応かっこの削除機能の無効化
(ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
(ad-activate 'delete-backward-char)

;; 対のかっこを強調
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;; かっこを虹色にシンタックスハイライトする
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; かっこの色を強調
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

(provide 'config-parens)
;;; conf-parens.el ends here
