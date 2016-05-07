(use-package hydra
  :ensure t
  :init )
pS
(defhydra hydra-next-error (global-map "C-x")
  "
Compilation Errors:
_j_: next error      _h_: first error _q_uit
_k_: previous error  _l_: last error
"
  ("`" next-error nil)
  ("j" next-error nil :bind nil)
  ("k" previous-error nil :bind nil)
  ("h" first-error nil :bind nil)
  ("l" (condition-case err
           (while t
             (next-error))
         (user-error nil))
   nil :bind nil)
  ("q" nil               nil :color blue))


(provide 'init-hydra)
