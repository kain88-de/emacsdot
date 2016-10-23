(use-package auctex
  :ensure t
  :defer t
  :config
  (setq-default TeX-engine 'pdflatex)
  (setq TeX-parse-self t
        reftex-plug-into-AUCTeX t
        TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  )

(provide 'init-auctex)
