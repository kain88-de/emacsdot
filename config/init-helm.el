(use-package helm
  :ensure t)

(use-package helm-make
  :ensure t
  :init
  (progn
  (setq helm-make-do-save t)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)))

(provide 'init-helm)
