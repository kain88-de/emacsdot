(use-package projectile
  :ensure t
  :defer 1
  :commands projectile-global-mode
  :commands helm-projectile-switch-project
  :init
  (defun max-save-and-build ()
    "Save and build projects with projectile"
    (interactive)
    (projectile-save-project-buffers)
    (projectile-compile-project t))
  :config
  (use-package helm-projectile
    :ensure t
    :init
    (setq projectile-completion-system 'helm)
    :config
    (helm-projectile-on))
  (use-package helm-ag
    :ensure t)
  (projectile-global-mode)
  :diminish projectile-mode)

(provide 'init-projectile)
