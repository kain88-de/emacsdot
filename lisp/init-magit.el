(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :init
  (progn
    (evil-leader/set-key "gs" 'magit-status)
    (evil-leader/set-key "gl" 'magit-log)
    (evil-leader/set-key "gb" 'magit-blame-mode)))

(provide 'init-magit)
