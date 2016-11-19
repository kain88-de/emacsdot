(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))
;; disable questions about theme loading
(setq custom-safe-themes t)

(use-package saveplace
  :ensure t
  :config
  (save-place-mode 1))

(use-package smart-mode-line
  :ensure t
  :init
  (sml/setup))

(use-package highlight-symbol
  :ensure t
  :general
  ("C-*" 'highlight-symbol-at-point))

(set-face-attribute 'default-frame-alist '(font . "Source Code Pro-12"))
(set-frame-font "Source Code Pro-12")

;; nice scrolling
(setq scroll-conservatively 101
      scroll-preserve-screen-position t)

;; free up screen space
(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1) ;; disable annoying blinking

(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default visible-bell t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; enable line wraping
(global-visual-line-mode)
(diminish 'visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; display keybind earlier
(setq echo-keystrokes 0)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#666600"))

(provide 'init-ui)
;;; init-ui.el ends here
