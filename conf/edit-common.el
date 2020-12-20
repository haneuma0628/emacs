;;; edit-common.el ---                               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

;; yspel
(require 'yspel)

;; aspell
; run with Japanese
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; flyspell
(eval-after-load "flyspell"
  '(progn
     (bind-key "C-;" nil flyspell-mode-map)
     ))

(provide 'edit-common)
;;; edit-common.el ends here
