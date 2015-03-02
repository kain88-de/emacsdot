(max/install-package 'projectile)

(projectile-global-mode)
(eval-after-load 'projectile '(diminish 'projectile-mode))

(provide 'init-projectile)
