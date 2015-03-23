(use-package google-c-style
  :ensure t
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
  :init
  (progn
    (setq clang-format-executable "clang-format-3.5")))

;; add new cpp11 features to the keyword list
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode
                        '(("noexcept" . 'font-lock-keyword-face)))

(provide 'init-c++)
