(use-package hydra :ensure t
  :config)

(use-package general
  :ensure t)

(defun max/smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there.

copied from:
http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/

"
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
(general-define-key "C-a" 'max/smarter-move-beginning-of-line)

(use-package expand-region
  :ensure t
  :general ("C-=" 'er/expand-region))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(provide 'init-util)
