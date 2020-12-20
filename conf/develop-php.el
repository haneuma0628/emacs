;;; develop-common.el --- for programming        -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist'("\\.php$" . php-mode))

(defun my-php-mode-hook ()
  "My hooks for php-mode."
  ; use tab-indent
  (setq indent-tabs-mode t)
  (setq tab-width 8)

  ; setting indent-style
  (c-set-style "bsd")
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-cont 0)

  ; improve array-indent
  (defun ywb-php-lineup-arglist-intro (langelem)
    (save-excursion
      (goto-char (cdr langelem))
      (vector (+ (current-column) c-basic-offset))))
  (defun ywb-php-lineup-arglist-close (langelem)
    (save-excursion
      (goto-char (cdr langelem))
      (vector (current-column))))
  (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
  (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close))
(add-hook 'php-mode-hook 'my-php-mode-hook)

(provide 'develop-php)
;;; develop-php.el ends here
