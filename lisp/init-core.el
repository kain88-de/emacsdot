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
  :commands (esup)
  :defer t)

;; nicer package manager
(use-package paradox
  :ensure t
  :commands (paradox-list-packages))

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; Protein Data Bank files are text
(setq auto-mode-alist (append '(("\\.pdb$" . text-mode)) auto-mode-alist))

;; Store tramp backups locally
(setq tramp-backup-directory-alist backup-directory-alist
      tramp-default-method "ssh")

(provide 'init-core)
