(max/install-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
(eval-after-load 'diminish '(diminish 'yas-minor-mode))

(provide 'init-yassnippet)
