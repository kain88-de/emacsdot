(use-package guide-key
  :ensure t
  :defer t
  :config
  (setq guide-key/guide-key-sequence t)
  :init
  (guide-key-mode 1))


(provide 'init-guide-key)
