(use-package magit
  :ensure t
  :defer t
  :general
  ("C-c g" 'magit-status)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(provide 'init-magit)
