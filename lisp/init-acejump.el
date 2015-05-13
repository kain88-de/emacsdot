(use-package ace-window
  :ensure t
  :defer t
  :bind ("M-p" . ace-window))

(use-package avy
  :defer t
  :init (evil-leader/set-key "SPC" 'avy-goto-char)
  :bind ("C-x SPC" . avy-goto-char))

(provide 'init-acejump)
