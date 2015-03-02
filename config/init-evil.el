(use-package evil
             :ensure t)
(use-package evil-leader
             :ensure t)
(use-package evil-surround
             :ensure t)

;; Set before loading evil
;; This let's evil overwrite some emacs settings
;; 1. use evil-search (vim-like search) instead of isearch
;; 2. use C-w for windows key bindings

(setq evil-search-module 'evil-search
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(require 'evil-surround)
(require 'evil-leader)

(evil-mode 1)
(setq evil-move-cursor-back nil)
(diminish 'undo-tree-mode)
(global-evil-surround-mode 1)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; Set mode indicator colors
(setq evil-normal-state-tag (propertize "N" 'face
                                        '((:background "green" :foreground "black")))
      evil-emacs-state-tag (propertize "E" 'face
                                       '((:background "orange" :foreground "black")))
      evil-insert-state-tag (propertize "I" 'face '((:background "red")))
      evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
      evil-visual-state-tag (propertize "V" 'face
                                        '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))

;; color cursor according to mode
(setq evil-emacs-state-cursor '("red" box)
      evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-insert-state-cursor '("red" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow))

;; evil keymappings
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; leader keymappings
(evil-leader/set-key "l"  'evil-ex-nohighlight)
(evil-leader/set-key "dw" 'whitespace-cleanup)
(evil-leader/set-key "m"  'magit-status)
(evil-leader/set-key "h"  'help)
(evil-leader/set-key "ft" '(lambda ()
                             (interactive)
                             (find-tag (find-tag-default))))

(provide 'init-evil)
