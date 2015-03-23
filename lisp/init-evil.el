(use-package evil
  :ensure t)
(use-package evil-leader
  :ensure t)
(use-package evil-surround
  :ensure t)

;; Set before activating evil
;; This let's evil overwrite some emacs settings
;; 1. use evil-search (vim-like search) instead of isearch
;; 2. use C-w for windows key bindings

(setq evil-search-module 'evil-search
      evil-want-C-w-in-emacs-state t)

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
(setq evil-emacs-state-cursor '("gray" box)
      evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-insert-state-cursor '("red" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow))

;; evil keymappings
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)
(define-key evil-visual-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "H" 'evil-beginning-of-line)

;; from spaceemacs
;; this NEEDS to run before I set any evil-leader keybinding
(defun max/declare-prefix (prefix name)
  "Declare a prefix PREFIX. PREFIX is a string describing
a key sequence. NAME is a symbol name used as the prefix command."
  (let ((command (intern (concat "group:" name))))
    ;; define the prefix command only if it does not already exist
    (unless (lookup-key evil-leader--default-map prefix)
      (define-prefix-command command)
      (evil-leader/set-key prefix command))))

(setq max/key-binding-prefixes '(("p" . "projects")
                                 ("f" . "files")
                                 ("h" . "help")
                                 ("b" . "buffers")
                                 ("a" . "ace-jump")
                                 ("c" . "compiler")
                                 ("g" . "git")
                                 ("w" . "window")))

(mapc (lambda (x) (max/declare-prefix (car x) (cdr x)))
      max/key-binding-prefixes)

;; leader keymappings
(evil-leader/set-key "bh" 'evil-ex-nohighlight)
(evil-leader/set-key "bw" 'whitespace-cleanup)
(evil-leader/set-key "bs" 'save-buffer)

(provide 'init-evil)
