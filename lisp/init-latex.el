(setq TeX-auto-save t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
;; open all tex files in LaTeX-mode
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))

(provide 'init-latex)
