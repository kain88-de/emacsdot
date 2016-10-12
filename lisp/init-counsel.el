(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  )

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x))
  )

;; Needed to search with counsel
;; (use-package ag
;;   :ensure t
;;   :)

(provide 'init-counsel)
