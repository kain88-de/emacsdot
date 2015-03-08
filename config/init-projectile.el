(use-package projectile
  :ensure t
  :config
  (progn
    (add-to-list 'projectile-globally-ignored-directories "build"))
  :idle (projectile-global-mode)
  :idle-priority 1)

;; this only works outside of use-package investigate
(eval-after-load 'projectile '(diminish 'projectile-mode))

(provide 'init-projectile)
