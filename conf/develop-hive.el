;;; develop-hive.el ---                          -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; hive-ql
(require 'sql)
(require 'sql-indent)
;; (autoload 'sql-mode "sql" "SQL Edit mode" t)
(add-to-list 'auto-mode-alist '("\\.hql$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.hql.jinja2$" . sql-mode))

(eval-after-load "sql"
  '(load-library "sql-indent"))
(setq sql-indent-offset 2)
(add-hook 'sql-mode-hook 'sqlind-minor-mode)

(defvar my-sql-indentation-offsets-alist
  `((select-clause 0)
    (insert-clause 0)
    (delete-clause 0)
    (update-clause 0)
    ,@sqlind-default-indentation-offsets-alist))

(add-hook 'sqlind-minor-mode-hook
    (lambda ()
       (setq sqlind-indentation-offsets-alist
             my-sql-indentation-offsets-alist)))

(provide 'develop-hive)
;;; develop-hive.el ends here
