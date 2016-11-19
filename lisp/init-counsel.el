(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :general
  ("M-x" 'counsel-M-x)
  ("C-x C-f" 'counsel-find-file)
  ("M-y" 'counsel-yank-pop))

(use-package swiper
  :ensure t
  :general
  ("C-s" 'swiper))

(use-package ace-window
  :ensure t
  :defer t
  :general
  ("C-x o" 'ace-window)
  :config
  (setq aw-dispatch-always t)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

(use-package avy
  :defer t
  :general
  ("C-c SPC" 'avy-goto-word-or-subword-1)
  :config
  (setq avy-style 'at-full)
  (setq avy-all-windows nil))

(provide 'init-counsel)
