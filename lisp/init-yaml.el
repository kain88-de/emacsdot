(use-package yaml-mode
  :ensure t
  :defer t
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :init
  (progn
    (add-hook 'yaml-mode-hook 'subword-mode)))

(provide 'init-yaml)
