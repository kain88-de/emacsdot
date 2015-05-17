(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (evil-leader/set-key "gs" 'magit-status)
  (evil-leader/set-key "gl" 'magit-log)
  (evil-leader/set-key "gb" 'magit-blame-mode))

(provide 'init-magit)
