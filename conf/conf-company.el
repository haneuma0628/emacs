;;; conf-company.el ---                            -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:
(use-package company
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

(use-package company-jedi
  :after company
  :config
  (push 'company-jedi company-backends))
(use-package company-robe
  :after company
  :config
  (push 'company-robe company-backends))

(provide 'config-company)
;;; conf-company.el ends here
