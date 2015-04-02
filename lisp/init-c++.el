(use-package google-c-style
  :ensure t
  :defer t
  :init
  (progn
    (defun max/cc-mode-hook ()
      (google-set-c-style)
      (google-make-newline-indent)
      (setq c-basic-offset 4))
    (add-hook 'c-mode-common-hook 'max/cc-mode-hook)
    (add-hook 'c++-mode-hook 'auto-complete-mode)))

(use-package clang-format
  :ensure t
  :defer t
  :init
  (progn
    (setq clang-format-executable "clang-format-3.5")))

;; add new cpp11 features to the keyword list
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode
                        '(("noexcept" . 'font-lock-keyword-face)))

(require 'cc-mode)

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
  :config
  (progn
    fa-config-default))

(evil-leader/set-key "cm" 'moo-complete)
(evil-leader/set-key "cf" 'fa-show)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(provide 'init-c++)
