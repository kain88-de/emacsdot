(use-package compile
  :defer t
  :init
  (setq compilation-ask-about-save nil
        compilation-always-kill t
        compilation-scroll-output 'first-error)
  (evil-leader/set-key "cn" 'next-error)
  (evil-leader/set-key "cp" 'previous-error))

;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(use-package ansi-color
  :ensure t
  :defer t
  :init
  (defun max/colorize-compilation-buffer ()
    "Colorize a compilation mode buffer."
    (interactive)
    ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
    (when (eq major-mode 'compilation-mode)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region (point-min) (point-max)))))
  (add-hook 'compilation-filter-hook #'max/colorize-compilation-buffer))

(provide 'init-compile)
