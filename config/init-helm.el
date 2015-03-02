(use-package helm
  :ensure t)

(use-package helm-make
  :ensure t
  :init
  (setq helm-make-do-save t))

(provide 'init-helm)
