(use-package discover-my-major
  :ensure t
  :defer t
  :init (general-define-key "C-h m" 'discover-my-major))

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(provide 'init-help)
