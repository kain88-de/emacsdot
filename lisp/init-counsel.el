(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  )

(use-package counsel
  :ensure t
  :init
  (general-define-key "M-x" 'counsel-M-x)
  (general-define-key "C-x C-f" 'counsel-find-file)
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
  (general-define-key "C-c w" 'ace-window))

(use-package avy
  :defer t
  :config
  (setq avy-style 'at-full)
  (setq avy-all-windows nil)
  :init
  (general-define-key "C-c SPC" 'avy-goto-word-or-subword-1))

(provide 'init-counsel)
