(use-package yasnippet
             :ensure t)
(require 'yasnippet)
(yas-global-mode 1)
(eval-after-load 'diminish '(diminish 'yas-minor-mode))

(provide 'init-yassnippet)
