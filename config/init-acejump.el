(use-package ace-window
  init:
  (progn
    (global-set-key (kbd "M-p") 'ace-window)))
(global-set-key (kbd "M-p") 'ace-window)

(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)
(provide 'init-acejump)
