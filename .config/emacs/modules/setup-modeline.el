(define-minor-mode @fenrir/modeline-hidden-mode
  "Toggle modeline visibility in the current buffer."
  :init-value nil
  :global nil
  (if @fenrir/modeline-hidden-mode
      (setq-local mode-line-format nil)
    (kill-local-variable 'mode-line-format)
    (force-mode-line-update)))

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-github t)
  (setq doom-modeline-github-interval (* 30 60))
  (setq doom-modeline-env-version t)
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-mu4e t)
  (setq inhibit-compacting-font-caches t))

(provide 'setup-modeline)
