(use-package magit
  :ensure t
  :defer t
  :init
  (add-to-list 'evil-emacs-state-modes 'magit-popup-mode)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (defhydra magit-hydra (global-map "C-<SPC> g" :color teal)
    ("s" magit-status)
    ("b" magit-branch-manager)
    ("l" magit-log)))

(provide 'init-magit)
