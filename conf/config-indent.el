;;; config-indent.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:
;; インデントを目立たせる
(use-package highlight-indent-guides-mode
  :hook prog-mode
  :init
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-odd-face-perc 10)
  (setq highlight-indent-guides-auto-even-face-perc 5))

(provide 'config-indent)
;;; config-indent.el ends here
