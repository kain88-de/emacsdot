(use-package guide-key
  :ensure t
  :defer t
  :config
  (setq guide-key/guide-key-sequence t)
  :init
  (guide-key-mode 1)
  :diminish guide-key-mode)


(provide 'init-guide-key)
