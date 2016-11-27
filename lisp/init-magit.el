(use-package magit
  :ensure t
  :defer t
  :general
  ("C-c g" 'magit-status)
  :config
  (setq magit-last-seen-setup-instructions "1.4.0"
        magit-visit-ref-behavior '(checkout-any focus-on-ref)))

(provide 'init-magit)
