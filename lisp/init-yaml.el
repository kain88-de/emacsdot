(use-package yaml-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'yaml-mode-hook 'subword-mode)))

(provide 'init-yaml)
