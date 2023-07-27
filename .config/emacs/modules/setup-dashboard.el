(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Fenrir Emacs")
  (setq dashboard-startup-banner (locate-user-emacs-file "config/logo/logo1.png"))
  ;; (setq dashboard-startup-banner nil)
  (setq dashboard-center-content t)
  (setq dashboard-items nil)
  (dashboard-setup-startup-hook))

(provide 'setup-dashboard)
