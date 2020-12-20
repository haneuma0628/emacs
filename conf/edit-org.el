;;; edit-org.el ---                                  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(unbind-key "C-<tab>" org-mode-map)
(bind-key "C->" 'org-force-cycle-archived org-mode-map)

(provide 'edit-org)
;;; edit-org.el ends here
