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
      (counsel-ag "" (projectile-project-root) ))
    (define-key projectile-command-map (kbd "ss") #'counsel-projectile-ag)
    )
  (projectile-global-mode)
  :diminish projectile-mode)

(use-package git-gutter
  :ensure t
  :config
  ;; (global-git-gutter-mode t))
;; TODO:make this work
 (add-hook 'projectile-mode-hook 'git-gutter-mode))

(provide 'init-projectile)
