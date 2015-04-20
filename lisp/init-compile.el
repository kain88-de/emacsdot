(use-package compile
  :defer t
  :config
  (setq compilation-ask-about-save nil
        compilation-always-kill t
        compilation-scroll-output 'first-error)
  (evil-leader/set-key "cn" 'next-error)
  (evil-leader/set-key "cp" 'previous-error))

;; extract ENV-VAR to eshell
;; (use-package exec-path-from-shell
;;   :ensure t
;;   :config
;;   (setq exec-path-from-shell-variables
;;         (quote
;;          ("PATH" "MANPATH" "LD_LIBRARY_PATH" "CPLUS_INCLUDE_PATH")))
;;   :init
;;   (exec-path-from-shell-initialize))

;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(use-package ansi-color
  :ensure t
  :defer t
  :config
  (defun max/colorize-compilation-buffer ()
    "Colorize a compilation mode buffer."
    (interactive)
    ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
    (when (eq major-mode 'compilation-mode)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region (point-min) (point-max)))))
  (add-hook 'compilation-filter-hook #'max/colorize-compilation-buffer))

(provide 'init-compile)
