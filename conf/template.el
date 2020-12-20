;;; package --- Summary
;;; Commentary:
;;; auto-insert するテンプレートを設定する
;;; Code:
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")

;; (define-auto-insert "\\.tex$" "tex-short-template.tex") ; tex
(define-auto-insert "\\.tex$" "tex-standard-template.tex") ; tex
;; (define-auto-insert "\\.html$" "html-template.html") ; htmlr
;; HiveQL
(define-auto-insert "\\.hql$" "yj-hiveql-template.hql")

(provide 'template)
;;; template.el ends here
