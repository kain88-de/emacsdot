(use-package guide-key
  :ensure t
  :defer t
  :config
  (progn
    (setq guide-key/guide-key-sequence t)
    (guide-key-mode 1)))


(provide 'init-guide-key)
