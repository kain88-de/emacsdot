(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))
;; disable questions about theme loading
(setq custom-safe-themes t)

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
  :init
  ;; (evil-leader/set-key "wl" 'rotate-layout)
  ;; (evil-leader/set-key "wh" 'rotate:even-horizontal)
  ;; (evil-leader/set-key "wv" 'rotate:even-vertical))

(use-package smart-mode-line
  :ensure t
  :init
  (sml/setup))

(use-package highlight-symbol
  :ensure t
  :config
  (define-key global-map (kbd "C-*") 'highlight-symbol-at-point))

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
(setq echo-keystrokes 0.5)

;; just display filename and don't fuss with brackets
(setq uniquify-buffer-name-style 'forward)

(provide 'init-ui)
