(use-package projectile
  :ensure t
  :defer 1
  :commands projectile-global-mode
  :commands counsel-projectile-switch-project
  :config
  ;; (use-package helm-projectile
  ;;   :ensure t
  ;;   :init
  ;;   (setq projectile-completion-system 'helm)
  ;;   :config
  ;;   (helm-projectile-on))
  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-on)
    (defun counsel-projectile-ag (&optional options)
      (interactive "P")
      (counsel-ag "" (projectile-project-root)))
    (define-key projectile-mode-map [remap projectile-ag] #'counsel-projectile-ag)
    )
  (projectile-global-mode)
  :diminish projectile-mode)

(provide 'init-projectile)
