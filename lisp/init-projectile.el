(use-package projectile
  :ensure t
  :defer 1
  :commands projectile-global-mode
  :commands helm-projectile-switch-project
  :init
  (defhydra projectile-hydra (global-map "C-c p" color:teal)
    ("p" helm-projectile-switch-project)
    ("f" helm-projectile-find-file)
    ("F" helm-projectile-find-file-in-known-projects)
    ("T" projectile-find-test-file)
    ("a" helm-projectile-find-other-file)
    ("b" helm-projectile-switch-to-buffer)
    ("S" projectile-save-project-buffers)
    ("P" projectile-test-project)
    ("c" max-save-and-build)
    ("sa" helm-projectile-ack)
    ("r" projectile-replace)
    ("I" projectile-ibuffer)
    ("g" helm-projectile-find-file-dwim))
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
  (projectile-global-mode)
  :diminish projectile-mode)

(provide 'init-projectile)
