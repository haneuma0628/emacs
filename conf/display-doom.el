;;; display-doom.el --- Summary:
;;; Commentary:
;; Doom Emacs の愉快ななかまたち
;; - doom-themes
;; - centaur-tabs
;; - doom-modeline
;;; Code:

;; doom-themes
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-sourcerer t)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; centaur-tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<tab>" . centaur-tabs-backward)
  ("C-<S-tab>" . centaur-tabs-forward))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'display-doom)
;;; display-doom.el ends here
