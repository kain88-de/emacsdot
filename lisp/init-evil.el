(use-package evil
  :ensure t
  :diminish (undo-tree-mode)
  :config
  ;; used to enable insert-mode pasting from global clip board
  (defun max/evil-insert-mode-paste ()
    (interactive)
    (evil-paste-before 1)
    (forward-char))
  ;; evil keymappings
  (bind-key "C-y" 'max/evil-insert-mode-paste evil-insert-state-map)

  (define-key evil-normal-state-map "L" 'evil-end-of-line)
  (define-key evil-normal-state-map "H" 'evil-beginning-of-line)
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
  (define-key evil-visual-state-map "L" 'evil-end-of-line)
  (define-key evil-visual-state-map "H" 'evil-beginning-of-line)
  (setq evil-search-module 'evil-search
        evil-move-cursor-back nil
        evil-symbol-word-search t
        evil-want-Y-yank-to-eol t
        ;; color cursor according to mode
        evil-emacs-state-cursor '("gray" box)
        evil-normal-state-cursor '("green" box)
        evil-visual-state-cursor '("orange" box)
        evil-insert-state-cursor '("red" bar)
        evil-replace-state-cursor '("red" bar)
        evil-operator-state-cursor '("red" hollow)
        ;; Set mode indicator colors
        evil-normal-state-tag (propertize "N" 'face
                                          '((:background "green" :foreground "black")))
        evil-emacs-state-tag (propertize "E" 'face
                                         '((:background "orange" :foreground "black")))
        evil-insert-state-tag (propertize "I" 'face '((:background "red")))
        evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
        evil-visual-state-tag (propertize "V" 'face
                                          '((:background "grey80" :foreground "black")))
        evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (progn
    (global-evil-surround-mode 1)))

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :config
  (hl-line-mode)
  (evil-escape-mode))

(provide 'init-evil)
