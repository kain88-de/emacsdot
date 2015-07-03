(use-package magit
  :ensure t
  :defer t
  :init
  (add-to-list 'evil-emacs-state-modes 'magit-popup-mode)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (evil-leader/set-key "gs" 'magit-status)
  (evil-leader/set-key "gl" 'magit-log)
  (evil-leader/set-key "gb" 'magit-blame-mode))

(provide 'init-magit)
