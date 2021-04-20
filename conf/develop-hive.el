;;; develop-hive.el ---                          -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(use-package sql
  :mode ("\\.hql$" . sql-mode))

(use-package sql-indent
  :after sql
  :hook (sql-mode . sqlind-minor-mode)
  :config
  (load-library "sql-indent")
  (defvar my-sql-indentation-offsets-alist
    `((select-clause 0)
      (insert-clause 0)
      (delete-clause 0)
      (update-clause 0)
      ,@sqlind-default-indentation-offsets-alist))
  (setq sqlind-indentation-offsets-alist
        my-sql-indentation-offsets-alist))

(provide 'develop-hive)
;;; develop-hive.el ends here
