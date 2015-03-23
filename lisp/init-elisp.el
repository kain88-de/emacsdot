(add-hook 'emacs-lisp-mode-hook '(lambda () (turn-on-eldoc-mode)
                                   (company-mode)))

(provide 'init-elisp)
