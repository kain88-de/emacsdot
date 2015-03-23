(use-package ample-theme
  :ensure t
  :init (load-theme 'zenburn t))

(use-package fill-column-indicator
  :ensure t
  :config
  (progn
    (setq fci-rulw-width 2)
    (setq fci-rule-column 80)))

(use-package saveplace
  :init
  (progn
    (setq-default save-place t)
    (setq save-place-file (concat user-emacs-directory "saveplace.el"))))

(use-package rotate
  :init
  (progn
    (evil-leader/set-key "wl" 'rotate-layout)
    (evil-leader/set-key "wh" 'rotate:even-horizontal)
    (evil-leader/set-key "wv" 'rotate:even-vertical)))

;; nice scrolling
(setq smooth-scroll-margin 0)
(setq scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1) ;; disable annoying blinking
(global-set-key (kbd "<f12>") 'menu-bar-mode)
(set-frame-size (selected-frame) 100 40)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(set-default-font "Inconsolata-13")
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default visible-bell t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-visual-line-mode)

;; use <ESC> to quit command
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(provide 'init-ui)
