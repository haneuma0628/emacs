;;; develop-rust.el ---                          -*- lexical-binding: t; -*-

;; Copyright (C) 2020  TAKAHASHI Manaka
;;; Commentary:
;;
;;; Code:

;; Rust
(require 'rust-mode)
(add-to-list 'auto-mode-alist'("\\.rs$" . rust-mode))

(use-package racer
  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'racer-mode-hook 'eldoc-mode))

(setq racer-rust-src-path "/Users/mantakah/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
(setq racer-cmd "/Users/mantakah/.cargo/bin/racer")

(use-package flycheck-rust
  :init
  (add-hook 'rust-mode-hook
            '(lambda ()
            (flycheck-mode)
            (flycheck-rust-setup))))

(provide 'develop-rust)
;;; develop-rust.el ends here
