(use-package magit
  :ensure t
  :defer t
  :init
  (progn
    (evil-leader/set-key "gs" 'magit-status)
    (evil-leader/set-key "gl" 'magit-log)))

(provide 'init-magit)
