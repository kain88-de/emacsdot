(setq user-full-name "Max Linke"
      user-mail-address "max_linke@gmx.de")

(add-to-list 'load-path (concat user-emacs-directory "config"))

;; core elements and ui
(require 'init-core)
(require 'init-evil)
(require 'init-ui)

;; programming related packages
(require 'init-programming)
(require 'init-helm)
(require 'init-projectile)
(require 'init-yassnippet)
(require 'init-c++)
(require 'init-python)
(require 'init-elisp)

;; organization and writing
(setq sentence-end-double-space nil)
(require 'init-org)
(require 'init-latex)

(defun max-reload-init ()
  (interactive)
  (load-file (expand-file-name "~/.emacs.d/init.el")))
