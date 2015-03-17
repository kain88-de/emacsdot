(use-package google-c-style
  :ensure t)

(use-package auto-complete
  :ensure t
  :defer t)

(use-package clang-format
  :ensure t
  :init
  (progn
    (setq clang-format-executable "clang-format-3.5")))

(require 'google-c-style)
(defun max/cc-mode-hook ()
  (google-set-c-style)
  (google-make-newline-indent)
  (setq c-basic-offset 4))
(add-hook 'c-mode-common-hook 'max/cc-mode-hook)
(add-hook 'c++-mode-hook 'auto-complete-mode)

;;Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
(setq ac-comphist-file
      (expand-file-name "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)
(diminish 'auto-complete-mode)
(push '("\\.h\\'" . c++-mode) auto-mode-alist)

;; add new cpp11 features to the keyword list
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))
(font-lock-add-keywords 'c++-mode
                        '(("noexcept" . 'font-lock-keyword-face)))

(provide 'init-c++)
