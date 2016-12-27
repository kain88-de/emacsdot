(use-package elpy
  :ensure t
  :defer 1
  :config
  (add-to-list 'exec-path "/home/max/anaconda2/bin")
  (setq elpy-rpc-python-command "/home/max/anaconda2/bin/python")
  (setq python-check-command "/home/max/anaconda2/bin/flake8")
  (elpy-enable))

(use-package py-yapf
  :ensure t)

(use-package cython-mode
  :ensure t
  :mode ("\\.pyx\\'" . cython-mode)
  :defer)

(use-package conda
  :ensure t
  :defer
  :config
  (setq conda-anaconda-home "/home/max/anaconda2")
  (conda-env-initialize-interactive-shells))

;; python version depdentend shebangs
(add-to-list 'interpreter-mode-alist '("python2" . elpy-mode))
(add-to-list 'interpreter-mode-alist '("python3" . elpy-mode))

(provide 'init-python)
