(use-package ledger-mode
  :ensure t
  :commands ledger-mode
  :mode ("\\.ledger\\'" . ledger-mode)
  :preface
  (defun max-ledger-start-entry (&optional arg)
    (interactive "p")
    (find-file-other-window "~/Documents/private-live/finanzen/git/all.ledger")))

(provide 'init-ledger)
