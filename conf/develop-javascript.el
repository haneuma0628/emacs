;;; develop-javascript.el ---                    -*- lexical-binding: t; -*-
;;; Commentary:
;; for JavaScript
;;; Code:

;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js4-basic-offset 4
              js-switch-indent-offset 4
              tab-width 4
              indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)))
(add-hook 'js2-mode-hook #'js-auto-format-mode)
(add-hook 'js2-mode-hook #'add-node-modules-path)

;; for jQuery
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; for nodejs
(setq js2-include-node-externs t)

; disable jshint since we prefer eslint checking
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))))

; TypeScript(tide)
(add-to-list 'auto-mode-alist'("\\.tsx$" . typescript-mode))
(setq-default typescript-indent-level 2)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

; TypeScript mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(provide 'develop-javascript)
;;; develop-javascript.el ends here
