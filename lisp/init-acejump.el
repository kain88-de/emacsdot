(use-package ace-window
  :ensure t
  :defer t
  :config (setq aw-dispatch-always t)
  :init
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  (evil-leader/set-key "wd" 'ace-delete-window)
  (evil-leader/set-key "ws" 'ace-swap-window)
  (evil-leader/set-key "wm" 'ace-maximize-window)
  (evil-leader/set-key "wp" 'ace-window)
  :bind ("M-p" . ace-window))

(use-package avy
  :defer t
  :init
  (evil-leader/set-key "SPC" 'avy-goto-char)
  (setq avy-style 'at-full)
  (setq avy-all-windows nil)
  :bind ("C-x SPC" . avy-goto-char))

(provide 'init-acejump)
