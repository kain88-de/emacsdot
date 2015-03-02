(max/install-package 'smooth-scrolling)
(require 'fill-column-indicator)
(require 'smooth-scrolling)
(require 'saveplace)

(when window-system
  (tooltip-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1))
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-set-key (kbd "<f12>") 'menu-bar-mode)

(set-default-font "Inconsolata-13")
(load-theme 'monokai t)

;; Change "yes or no" to "y or n"
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use a more save scrolling behavior
(setq smooth-scroll-margin 5)
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; Jump to the last cursor position after opening a file
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "saveplace.el") )

(setq-default visible-bell t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-visual-line-mode)
(setq fci-rulw-width 2)
(setq fci-rule-column 80)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq-default fill-column 80)


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
