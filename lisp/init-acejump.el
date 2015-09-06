(use-package ace-window
  :ensure t
  :defer t
  :config
  (setq aw-dispatch-always t)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  :init
  (global-set-key (kbd "C-c w") 'ace-window))


(use-package avy
  :defer t
  :config
  (setq avy-style 'at-full)
  (setq avy-all-windows nil)
  :bind ("C-c SPC" . avy-goto-word-or-subword-1))

(provide 'init-acejump)
