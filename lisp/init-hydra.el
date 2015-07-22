(use-package hydra
  :ensure t
  :init )

(defhydra hydra-goto-line (goto-map ""
                           :pre (linum-mode 1)
                           :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))

(global-set-key (kbd "M-g M-g") 'hydra-goto-line/body)

(defun occur-dwim ()
  "Call `occur' with a sane default, chosen as the thing under point or selected region"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; Keeps focus on *Occur* window, even when when target is visited via RETURN key.
;; See hydra-occur-dwim for more options.
(defadvice occur-mode-goto-occurrence (after occur-mode-goto-occurrence-advice activate)
  (other-window 1)
  (hydra-occur-dwim/body))

;; Focus on *Occur* window right away.
(add-hook 'occur-hook (lambda () (other-window 1)))

(defun reattach-occur ()
  (if (get-buffer "*Occur*")
    (switch-to-buffer-other-window "*Occur*")
    (hydra-occur-dwim/body) ))

;; Used in conjunction with occur-mode-goto-occurrence-advice this helps keep
;; focus on the *Occur* window and hides upon request in case needed later.
(defhydra hydra-occur-dwim ()
  "Occur mode"
  ("o" occur-dwim "Start occur-dwim" :color red)
  ("j" occur-next "Next" :color red)
  ("k" occur-prev "Prev":color red)
  ("h" delete-window "Hide" :color blue)
  ("r" (reattach-occur) "Re-attach" :color red))

(global-set-key (kbd "C-x o") 'hydra-occur-dwim/body)


(defhydra hydra-window (global-map "C-x w" :color red)
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
  ("v" split-window-right)
  ("x" split-window-below)
  ("o" delete-other-windows :exit t)
  ("a" ace-window :exit t)
  ("q" nil)
  ("b" helm-mini))

(defhydra hydra-showme (global-map "C-c s")
  "
Emacs Variables ---> Tools ---------------> Informational
_k_: kill ring         _c_: calculator          _C_: World clock
_b_: buffer list
_m_: mark ring         _g_: surf using surfraw
_e_: eshell history                           _d_: Calendar
"
  ("k" helm-show-kill-ring)
  ("b" helm-buffers-list)
  ("m" helm-all-mark-rings)
  ("c" helm-calcul-expression)
  ("e" helm-eshell-history)
  ("g" helm-surfraw)
  ("C" helm-world-time)
  ("d" calendar))

(provide 'init-hydra)
