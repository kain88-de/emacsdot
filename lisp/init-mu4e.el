(use-package mu4e
  :defer 1
  :init
  (setq mu4e-maildir     "~/mail/maildirs"
        mu4e-sent-folder "/gmx/Sent"
        mu4e-drafts-folder "/gmx/Drafts"
        mu4e-trash-folder "/gmx/Trash"
        mu4e-refile-folder "/Archives/.2016")
  )

(provide 'init-mu4e)
