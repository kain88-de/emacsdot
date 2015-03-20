(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'projectile-globally-ignored-directories "build")
    (projectile-global-mode)))

;; this only works outside of use-package investigate
(eval-after-load 'projectile '(diminish 'projectile-mode))
;; evil projectile bindings
(evil-leader/set-key "pp" 'helm-projectile-switch-project)
(evil-leader/set-key "pf" 'helm-projectile-find-file)
(evil-leader/set-key "pT" 'helm-projectile-find-test-file)
(evil-leader/set-key "pb" 'helm-projectile-find-other-file)
(evil-leader/set-key "pS" 'projectile-save-project-buffers)
(evil-leader/set-key "pP" 'projectile-test-project)
(evil-leader/set-key "pc" 'max-save-and-build)

(provide 'init-projectile)
