(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defun max/install-package (package)
  "Install given PACKAGE.if it isn't installed already"
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defvar max/packages '(magit company auto-complete diminish))

(dolist (p max/packages)
  (max/install-package p))

;; save backup centrally in my emacs config.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; I need to make sure that this file is created when it doesn't exists
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init-core)
