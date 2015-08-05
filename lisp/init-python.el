(use-package elpy
  :ensure t
  :defer 1
  :config (elpy-enable))

(use-package py-yapf
  :ensure t)

(use-package cython-mode
  :ensure t
  :mode ("\\.pyx\\'" . cython-mode)
  :defer)

(provide 'init-python)
