(use-package magit
  :ensure t
  :defer t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (general-define-key "C-c g" 'magit-status))

(provide 'init-magit)
