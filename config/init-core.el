(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package magit
  :ensure t
  :defer t)

(use-package diminish
  :ensure t
  :defer t)

;; save backup centrally in my emacs config.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" "" custom-file)) ; touching the file
(load custom-file)

(provide 'init-core)
