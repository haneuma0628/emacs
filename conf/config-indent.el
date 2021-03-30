;;; config-indent.el ---                             -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:
;; インデントを目立たせる
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(setq highlight-indent-guides-method 'fill)
(setq highlight-indent-guides-auto-odd-face-perc 10)
(setq highlight-indent-guides-auto-even-face-perc 5)

(provide 'config-indent)
;;; config-indent.el ends here
