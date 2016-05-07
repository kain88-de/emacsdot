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
  (define-key global-map (kbd "C-c x") 'helm-M-x)
  :init
  (setq helm-split-window-in-side-p nil
        helm-move-to-line-cycle-in-source t
        helm-ff-file-name-history-use-recentf t
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (evil-leader/set-key "pi" 'helm-semantic-or-imenu)
  (evil-leader/set-key "ci" 'helm-imenu)
  (evil-leader/set-key "x" 'helm-M-x))


(use-package helm-make
  :ensure t
  :defer t
  :init
  (setq helm-make-do-save t))

(use-package helm-swoop
  :ensure t
  :defer t)

(provide 'init-helm)
