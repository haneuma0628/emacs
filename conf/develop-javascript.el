;;; develop-javascript.el ---                    -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; JavaScript
(use-package js2-mode
  :mode "\\.js$"
  :config
  (tern-mode t)
  (setq-default js4-basic-offset 4
                js-switch-indent-offset 4
                tab-width 4
                indent-tabs-mode nil)
  (put 'upcase-region 'disabled nil)
  ;; Node.js
  (setq js2-include-node-externs t))

(use-package js-auto-format-mode
  :hook js2-mode)
(use-package add-node-modules-path
  :hook js2-mode)

;; jQuery
(use-package tern-auto-complete
  :after tern
  :config
  (tern-ac-setup))

;; TypeScript
(use-package typescript-mode
  :mode "\\.tsx$"
  :config
  (setq-default typescript-indent-level 2))
(use-package tide
  :after typescript-mode
  :hook ((before-save . tide-format-before-save)
         (typescript-mode . setup-tide-mode))
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1)))

(provide 'develop-javascript)
;;; develop-javascript.el ends here
