(use-package guide-key
  :ensure t
  :defer 5
  :config
  (setq guide-key/guide-key-sequence t)
  :init
  (guide-key-mode 1)
  :diminish guide-key-mode)


(provide 'init-guide-key)
