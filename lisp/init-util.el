(use-package change-inner
  :ensure t
  :config
  (global-set-key (kbd "C-c i") 'change-inner)
  (global-set-key (kbd "C-c o") 'change-outer))

(provide 'init-util)
