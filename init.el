;; Since package.el now wants me to have package-initialize in the init.el
;; explicitly to all related setup first no matter what.
(setq gc-cons-threshold 5000000000)

(require 'package)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; (setq use-package-verbose t)


(setq user-full-name "Max Linke"
      user-mail-address "max_linke@gmx.de")

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; core elements and ui
(require 'init-core)
;; (require 'init-evil)
(require 'init-util)
(require 'init-ui)

;; make emcas a lot more user friendly for me
(require 'init-counsel)
(require 'init-projectile)
(require 'init-guide-key)
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
(require 'init-shell)
(require 'init-docker)
(require 'init-rust)

;; organization and writing
(require 'init-writing)
(require 'init-org)
(require 'init-latex)
(require 'init-mu4e)

;; reset gc value to keep emacs from hogging memory
(setq gc-cons-threshold 800000)
