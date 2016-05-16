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
  ("c" org-capture :color blue)
  ("e" org-export-dispatch :color blue)
  ("j" (lambda ()
         (interactive)
         (find-file "~/org/organizer.org"))))
;; overwrite the evil C-o binding that I never use
(define-key global-map (kbd "C-o") 'hydra-org/body)
(define-key evil-normal-state-map (kbd "C-o") 'hydra-org/body)


(provide 'init-hydra)
