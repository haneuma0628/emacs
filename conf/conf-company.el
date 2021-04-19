;;; conf-company.el ---                            -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:
(use-package company
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :init
  (add-to-list 'company-backends 'company-jedi)
  (add-to-list 'company-backends 'company-robe)
  (progn
    (set-face-attribute 'company-tooltip nil
                        :foreground "black" :background "lightgrey")
    (set-face-attribute 'company-tooltip-common nil
                        :foreground "black" :background "lightgrey")
    (set-face-attribute 'company-tooltip-common-selection nil
                        :foreground "white" :background "steelblue")
    (set-face-attribute 'company-tooltip-selection nil
                        :foreground "black" :background "steelblue")
    (set-face-attribute 'company-preview-common nil
                        :background nil :foreground "lightgrey" :underline t)
    (set-face-attribute 'company-scrollbar-fg nil
                        :background "orange")
    (set-face-attribute 'company-scrollbar-bg nil
                        :background "gray40"))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

(provide 'config-company)
;;; conf-company.el ends here
