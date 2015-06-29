(use-package cc-mode
  :defer t)

(use-package google-c-style
  :ensure t
  :defer t
  :init
  (defun max/cc-mode-hook ()
    (google-set-c-style)
    (setq c-basic-offset 4))
  (add-hook 'c-mode-common-hook 'max/cc-mode-hook))

;; In some projects I like to have the buffer automatically formatted when I
;; save it. For this use the following line in your '.dir-locals.el'
;;  (c++-mode
;;   (eval add-hook 'before-save-hook #'clang-format-buffer nil t))
(use-package clang-format
  :ensure t
  :defer t
  :init
  (setq clang-format-executable "clang-format-3.5"))

(use-package semantic
  :defer t
  :config
  (progn
    (global-semanticdb-minor-mode 1)
    (global-semantic-idle-scheduler-mode 1)
    (semantic-mode)))

(use-package function-args
  :ensure t
  :defer t
  :init
  (evil-leader/set-key "cm" 'moo-complete)
  (evil-leader/set-key "cf" 'fa-show)
  :config
  (fa-config-default))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; add new cpp11 features to the keyword list
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode
                        '(("noexcept" . 'font-lock-keyword-face)))

(provide 'init-c++)
