(setq gc-cons-threshold 5000000000)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; (setq use-package-verbose t)

;; save backup centrally in my emacs config.
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups")))
(setq auto-save-list-file-prefix "~/.emacs.d/autosave")
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave" t)))

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(defun max-reload-init ()
  (load-file (expand-file-name "~/.emacs.d/init.el")))

;; nice package to measure start up time of emacs
(use-package esup
  :ensure t
  :defer t)

;; nicer package manager
(use-package paradox
  :ensure t)

;; Protein Data Bank files are text
(setq auto-mode-alist (append '(("\\.pdb$" . text-mode)) auto-mode-alist))

;; Store tramp backups locally
(setq tramp-backup-directory-alist backup-directory-alist)

(provide 'init-core)
