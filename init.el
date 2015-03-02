(setq user-full-name "Max Linke"
      user-mail-address "max_linke@gmx.de")

(add-to-list 'load-path (concat user-emacs-directory "config"))

;; core elements and ui
(require 'init-core)
(require 'init-evil)

;;; programming related packages
(require 'init-programming)
(require 'init-helm)
(require 'init-projectile)
(require 'init-yassnippet)
(require 'init-c++)
(require 'init-python)
(require 'init-elisp)

;; organization and writing
(setq sentence-end-double-space nil)
(setq-default fill-column 80) ;; wrap at 80 chars
(require 'init-org)
(require 'init-latex)

;; invoke this as the last package. This is important because it changes the
;; window size and to keep other things from overriding it again just call it
;; last.
(require 'init-ui)

(defun max-reload-init ()
  (interactive)
  (load-file (expand-file-name "~/.emacs.d/init.el")))
