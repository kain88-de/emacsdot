(use-package projectile
             :ensure t)

(projectile-global-mode)
(eval-after-load 'projectile '(diminish 'projectile-mode))

(provide 'init-projectile)
