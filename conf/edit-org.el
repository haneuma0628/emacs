;;; edit-org.el ---                                  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; org-mode
(use-package org
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         (:map org-mode-map
               ("C-c s" . org-sort)))
  :mode ("\\.org$" . org-mode)
  :init
  ;; org-default-notes-fileのディレクトリ
  (setq org-directory "~/org/")
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
  ;; org-agenda の対象となるファイル
  (setq org-agenda-files (list "~/org/todo.org"))
  :config
  ;; 見出しの余分な*を消す
  (setq org-hide-leading-stars t)
  ;; org-default-notes-fileのファイル名
  (setq org-default-notes-file "notes.org")
  ;; 右端で折り返す
  (setq org-startup-truncated nil)
  (setq org-log-done t)
  (setq org-log-done 'time)
  ;; Other
  (bind-key "C-," 'beginning-of-buffer org-mode-map)
  (unbind-key "C-<tab>" org-mode-map)
  (add-hook 'org-mode-hook 'turn-on-font-lock))

(provide 'edit-org)
;;; edit-org.el ends here
