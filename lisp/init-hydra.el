(use-package hydra
  :ensure t
  :init )

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("f" text-scale-decrease "out"))
