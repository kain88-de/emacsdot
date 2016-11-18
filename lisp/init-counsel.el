(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  )

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x))
  )

(use-package swiper
  :init
  (general-define-key "C-s" 'swiper))

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

(provide 'init-counsel)
