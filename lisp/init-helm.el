(use-package helm
  :ensure t
  :defer t
  :bind (("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("M-x" . helm-M-x))
  :config
  (progn
    (use-package helm-config
      :defer t)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))
  :init
  (progn
    (setq helm-split-window-in-side-p nil
          helm-move-to-line-cycle-in-source t
          helm-ff-file-name-history-use-recentf t
          helm-M-x-fuzzy-match t
          helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t)))

(evil-leader/set-key "ff" 'helm-find-files)
(evil-leader/set-key "x" 'helm-M-x)

(use-package helm-projectile
  :ensure t
  :defer 1
  :init
  (progn
    (setq projectile-completion-system 'helm)))

(use-package helm-make
  :ensure t
  :defer t
  :init
  (progn
  (setq helm-make-do-save t)))

(provide 'init-helm)
