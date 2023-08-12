(use-package all-the-icons
  :ensure t
  :if (display-graphic-p)

  :config
  (setq inhibit-compacting-font-caches t))

(use-package nerd-icons
  :ensure t)

(provide 'setup-icons)
