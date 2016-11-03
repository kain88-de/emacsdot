(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode))

(use-package rustfmt
  :ensure t
  :init
  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save))

(provide 'init-rust)
