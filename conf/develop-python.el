;;; develop-python.el ---                        -*- lexical-binding: t; -*-

;; Copyright (C) 2020  TAKAHASHI Manaka
;;; Commentary:
;;
;;; Code:

;; Python
(require 'python)
(require 'py-autopep8)
(require 'epc)
(require 'jedi-core)

; change python version to 3
(setq python-shell-interpreter "python3"
      flycheck-python-pycompile-executable "python3")
(setenv "PYTHONPATH" (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'"))

; elpy
(elpy-enable)

; jedi(on company)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

; pyflakes
(flymake-mode t)
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-flymakes-executeble "/usr/local/bin/flake8")
(custom-set-variables
 '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128"))))

; autopep8
(define-key python-mode-map (kbd "C-c l") 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=120"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

; hook
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq python-indent-offset 4)))

(provide 'develop-python)
;;; develop-python.el ends here
