(use-package magit
  :ensure t
  :defer t
  :general
  ("C-c g" 'magit-status)
  :config
  (setq magit-last-seen-setup-instructions "1.4.0"
        magit-visit-ref-behavior '(checkout-any focus-on-ref))
  (add-hook 'with-editor-mode-hook 'evil-insert-state))

(use-package evil-magit
  :ensure t)

(provide 'init-magit)
