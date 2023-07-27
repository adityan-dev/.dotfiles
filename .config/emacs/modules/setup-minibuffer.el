(use-package minibuffer
  :straight nil
  :hook (minibuffer-setup .  cursor-intangible-mode))

(use-package savehist
  :defer 2
  :hook (after-init . savehist-mode)
  :config
  (setq savehist-file (concat user-cache-directory "savehist"))
  (setq history-length 1000)
  (setq history-delete-duplicates t)
  (setq savehist-save-minibuffer-history t))

(provide 'setup-minibuffer)
