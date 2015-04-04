(use-package ace-window
  :ensure t
  :defer t
  :bind ("M-p" . ace-window))

(use-package ace-jump-mode
  :defer t
  :init (evil-leader/set-key "SPC" 'ace-jump-mode)
  :bind ("C-x SPC" . ace-jump-mode))

(provide 'init-acejump)
