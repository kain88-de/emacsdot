(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package whitespace
  :ensure t
  :init
  (progn
    (setq-default whitespace-style '(face tabs empty
                                          trailing lines-tail tab-mark))
    (add-hook 'before-save-hook 'whitespace-cleanup))
  :config (global-whitespace-mode))

(use-package company
  :ensure t
  :defer t)

;; highlight specific keywords
(add-hook 'prog-mode-hook (lambda ()
                            (font-lock-add-keywords
                             nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
                                    1 font-lock-warning-face t)))))

(electric-pair-mode 1)
(setq-default fill-column 80) ;; wrap at 80 chars

;; set indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(provide 'init-programming)
