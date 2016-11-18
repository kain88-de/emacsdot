(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode))

(use-package rustfmt
  :ensure t
  :init
  (setq rustfmt-bin "/home/max/.cargo/bin/rustfmt")
  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save))

(provide 'init-rust)
