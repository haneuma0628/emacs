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
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

    Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
    All buffer name start with * will group to \"Emacs\".
    Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
	 (cond
	  ((or (string-equal "*" (substring (buffer-name) 0 1))
	       (memq major-mode '(magit-process-mode
				              magit-status-mode
				              magit-diff-mode
				              magit-log-mode
				              magit-file-mode
				              magit-blob-mode
				              magit-blame-mode
				              )))
	   "Emacs")
	  ((derived-mode-p 'prog-mode)
	   "Editing")
	  ((derived-mode-p 'dired-mode)
	   "Dired")
	  ((memq major-mode '(helpful-mode
			              help-mode))
	   "Help")
	  ((memq major-mode '(org-mode
			              org-agenda-clockreport-mode
			              org-src-mode
			              org-agenda-mode
			              org-beamer-mode
			              org-indent-mode
			              org-bullets-mode
			              org-cdlatex-mode
			              org-agenda-log-mode
			              diary-mode))
	   "OrgMode")
	  (t
	   (centaur-tabs-get-group-name (current-buffer))))))
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("C-<S-tab>" . centaur-tabs-backward)
  :hook
  (term-mode . centaur-tabs-local-mode)
  (calendar-mode . centaur-tabs-local-mode)
   (org-agenda-mode . centaur-tabs-local-mode))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'display-doom)
;;; conf-doom.el ends here
