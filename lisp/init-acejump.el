(use-package ace-window
  :ensure t
  :bind ("M-p" . ace-window))

(use-package ace-jump-mode
  :config (evil-leader/set-key "SPC" 'ace-jump-mode))

;; TODO: bind this with use-package
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)

(provide 'init-acejump)
