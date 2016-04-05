(use-package elpy
  :ensure t
  :defer 1
  :config
  (add-to-list 'exec-path "/home/max/conda/bin")
  (setq elpy-rpc-python-command "/home/max/conda/bin/python")
  (setq python-check-command "/home/max/conda/bin/flake8")
  (elpy-enable))

(use-package py-yapf
  :ensure t)

(use-package cython-mode
  :ensure t
  :mode ("\\.pyx\\'" . cython-mode)
  :defer)

(provide 'init-python)
