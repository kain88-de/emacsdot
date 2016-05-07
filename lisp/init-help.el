(use-package discover-my-major
  :ensure t
  :defer t
  :init (define-key global-map (kbd "C-h m") 'discover-my-major))

(provide 'init-help)
