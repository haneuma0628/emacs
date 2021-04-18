;;; develop-rust.el ---                          -*- lexical-binding: t; -*-

;; Copyright (C) 2020  TAKAHASHI Manaka
;;; Commentary:
;;
;;; Code:

(use-package rust-mode
  :mode "\\.rs$")

(use-package racer
  :hook rus-mode
  :config
  (setq racer-rust-src-path "/Users/mantakah/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
  (setq racer-cmd "/Users/mantakah/.cargo/bin/racer"))

(use-package flycheck-rust
  :hook ((rust-mode . flycheck-mode)
         (rust-mode . flycheck-rust-setup)))

(provide 'develop-rust)
;;; develop-rust.el ends here
