(use-package compile
  :defer t
  :config
  (setq compilation-ask-about-save nil
        compilation-always-kill t
        compilation-environment (list (format
                                       "LIBRARY_PATH=%s/.local/lib" (getenv "HOME"))
                                      (format
                                       "LD_LIBRARY_PATH=%s/.local/lib" (getenv "HOME"))
                                      (format
                                       "CPLUS_INCLUDE_PATH=%s/.local/include" (getenv "HOME")))
        compilation-scroll-output 'next-error
        ;; don't stop on info or warning
        compilation-skip-threshold 2))

(defhydra hydra-compiling (global-map "C-c c")
  " general compiler programming stuff "
  ("n" next-error)
  ("p" previous-error)
  ("m" moo-complete)
  ("f" fa-show)
  ("q" nil               nil :color blue))
(general-define-key "C-c c" 'hydra-compiling/body)

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
