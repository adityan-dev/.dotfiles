(use-package paredit
  :ensure t)

(use-package paren
  :straight t
  :defer 2
  :config
  (show-paren-mode 1)
  (setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t))

(use-package ansi-color
  :straight t
  :hook (compilation-filter . ansi-color-compilation-filter))

(electric-pair-mode 1)

(provide 'setup-prog)
