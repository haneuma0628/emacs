;;; edit-org.el ---                                  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key org-mode-map "\C-cs" 'org-sort)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")
;; 右端で折り返す
(setq org-startup-truncated nil)
;; org-capture templates
(setq org-capture-templates
   '(("t" "Todo" entry (file+headline (lambda () (concat org-directory "/todo.org")) "Tasks")
      "* TODO %?\n   DEADLINE: %^t")
     ("n" "note" entry (file+headline (lambda () (concat org-directory "/note.org")) "Notes")
      "* %?\n   %T")
     ("j" "Journal" entry (file+datetree (lambda () (concat org-directory "/journal.org")))
      "* %?\n")
     ))
;; TODO 管理
(setq org-todo-keywords
      '((sequence "TODO(t)" "WIP(w)" "IN_REVIEW(r)" "|" "DONE(d)" "SOMEDAY(s)" "CANCEL(c)")))
(setq org-agenda-files (list "~/org/todo.org"))
;
(setq org-log-done t)
(setq org-log-done 'time)
(unbind-key "C-<tab>" org-mode-map)
(bind-key "C->" 'org-force-cycle-archived org-mode-map)

(provide 'edit-org)
;;; edit-org.el ends here
