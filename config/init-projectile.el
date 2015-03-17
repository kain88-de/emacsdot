(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'projectile-globally-ignored-directories "build")
    (projectile-global-mode)))

;; this only works outside of use-package investigate
(eval-after-load 'projectile '(diminish 'projectile-mode))

(provide 'init-projectile)
