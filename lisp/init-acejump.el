(use-package ace-window
  :ensure t
  :defer t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  :bind ("M-p" . ace-window))

(use-package avy
  :defer t
  :init
  (evil-leader/set-key "SPC" 'avy-goto-char)
  (setq avy-style 'at-full)
  (setq avy-all-windows nil)
  :bind ("C-x SPC" . avy-goto-char))

(provide 'init-acejump)
