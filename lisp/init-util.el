(use-package hydra :ensure t
  :config)

(use-package general
  :ensure t)

(use-package expand-region
  :ensure t
  :general ("C-=" 'er/expand-region))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(provide 'init-util)
