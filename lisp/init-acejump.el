(use-package ace-window
  :ensure t
  :defer t
  :config
  (setq aw-dispatch-always t)
  (defhydra hydra-window (global-map "C-c w" :color red)
    "
 Split: _v_ert _x_:horz
  Misc: _a_ce  _o_ther"
    ("h" windmove-left)
    ("j" windmove-down)
    ("k" windmove-up)
    ("l" windmove-right)
    ("H" hydra-move-splitter-left)
    ("J" hydra-move-splitter-down)
    ("K" hydra-move-splitter-up)
    ("L" hydra-move-splitter-right)
    ("d" ace-delete-window)
    ("s" ace-swap-window)
    ("m" ace-maximize-window)
    ("v" split-window-right)
    ("x" split-window-below)
    ("o" delete-other-windows :exit t)
    ("a" ace-window :exit t)
    ("q" nil)
    ("b" helm-mini))
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

(use-package avy
  :defer t
  :config
  (setq avy-style 'at-full)
  (setq avy-all-windows nil)
  :bind ("C-c SPC" . avy-goto-char))

(provide 'init-acejump)
