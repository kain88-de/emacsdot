(use-package projectile
  :ensure t
  :defer 1
  :commands projectile-global-mode
  :commands helm-projectile-switch-project
  :init
  ;; evil projectile bindings
  (evil-leader/set-key "pp" 'helm-projectile-switch-project)
  (evil-leader/set-key "pf" 'helm-projectile-find-file)
  (evil-leader/set-key "pF" 'helm-projectile-find-file-in-known-projects)
  (evil-leader/set-key "pT" 'projectile-find-test-file)
  (evil-leader/set-key "pa" 'helm-projectile-find-other-file)
  (evil-leader/set-key "pb" 'helm-projectile-switch-to-buffer)
  (evil-leader/set-key "pS" 'projectile-save-project-buffers)
  (evil-leader/set-key "pP" 'projectile-test-project)
  (evil-leader/set-key "pc" 'max-save-and-build)
  (evil-leader/set-key "psa" 'helm-projectile-ack)
  (evil-leader/set-key "pr" 'projectile-replace)
  (evil-leader/set-key "pI" 'projectile-ibuffer)
  (evil-leader/set-key "pg" 'helm-projectile-find-file-dwim)
  :config
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories "lin64_build")
  (use-package helm-projectile
    :init
    (setq projectile-completion-system 'helm)
    :config
    (helm-projectile-on))
  (projectile-global-mode)
  :diminish projectile-mode)

(provide 'init-projectile)
