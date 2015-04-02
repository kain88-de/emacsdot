(use-package discover-my-major
  :ensure t
  :defer t
  :config (evil-leader/set-key "hm" 'discover-my-major))

(evil-leader/set-key "hh" 'help)
(evil-leader/set-key "hf" 'describe-function)
(evil-leader/set-key "hv" 'describe-variable)

(provide 'init-help)
