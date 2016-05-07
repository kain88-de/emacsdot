(use-package hydra
  :ensure t
  :config)

(defhydra hydra-compiling (global-map "C-c c")
  " general compiler programming stuff "
  ("n" next-error)
  ("p" previous-error)
  ("m" moo-complete)
  ("f" fa-show)
  ("q" nil               nil :color blue))

(defhydra hydra-org ()
  " org functions access"
  ("a" org-agenda)
  ("c" org-capture)
  ("j" (lambda ()
         (interactive)
         (find-file "~/org/organizer.org"))))
;; overwrite the evil C-o binding that I never use
(global-set-key (kbd "C-o") 'hydra-org/body)


(provide 'init-hydra)
