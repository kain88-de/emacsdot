(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))

(use-package fill-column-indicator
  :ensure t
  :defer t
  :config
  (progn
    (setq fci-rulw-width 2)
    (setq fci-rule-column 80)))

(use-package saveplace
  :ensure t
  :defer t
  :config
  (progn
    (setq-default save-place t)
    (setq save-place-file (concat user-emacs-directory "saveplace.el"))))

(use-package rotate
  :ensure t
  :defer t
  :config
  (evil-leader/set-key "wl" 'rotate-layout)
  (evil-leader/set-key "wh" 'rotate:even-horizontal)
  (evil-leader/set-key "wv" 'rotate:even-vertical))

(evil-leader/set-key "w=" 'text-scale-increase)
(evil-leader/set-key "w-" 'text-scale-decrease)

(use-package highlight-symbol
  :ensure t
  :config
  (define-key global-map (kbd "C-*") 'highlight-symbol-at-point))

(set-face-attribute 'default-frame-alist '(font . "Source Code Pro-12"))
(set-frame-font "Source Code Pro-12")

;; nice scrolling
(setq smooth-scroll-margin 0)
(setq scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1) ;; disable annoying blinking

(define-key global-map (kbd "<f12>") 'menu-bar-mode)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default visible-bell t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-visual-line-mode)
(diminish 'visual-line-mode)

(provide 'init-ui)
