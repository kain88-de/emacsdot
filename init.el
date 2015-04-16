(defconst emacs-start-time (current-time))

(setq user-full-name "Max Linke"
      user-mail-address "max_linke@gmx.de")

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; core elements and ui
(require 'init-core)
(require 'init-evil)
(require 'init-ui)

;; make emcas a lot more user friendly for me
(require 'init-helm)
(require 'init-projectile)
(require 'init-guide-key)
(require 'init-acejump)
(require 'init-help)

;;programming related packages
(require 'init-compile)
(require 'init-magit)
(require 'init-programming)
(require 'init-yassnippet)

;; language packages
(require 'init-c++)
(require 'init-cmake)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-python)
(require 'init-yaml)
(require 'init-ledger)

;; organization and writing
(require 'init-writing)
(require 'init-org)
(require 'init-latex)
