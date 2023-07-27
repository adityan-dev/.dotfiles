;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (message "☯ Emacs loaded in %s seconds with %d garbage collections."
;;                      (emacs-init-time "%.4f")
;;                      gcs-done)))

(setq-default bidi-display-reordering 'left-to-right)

(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

(setq fast-but-imprecise-scrolling t)
(setq redisplay-skip-fontification-on-input t)

;;(setq frame-inhibit-implied-resize t)

(setq command-line-ns-option-alist nil)

(condition-case-unless-debug nil 
    (use-package gcmh
      :defer 2
      :straight t
      ;; :hook (after-init . gcmh-mode)
      :config
      (setq gcmh-idle-delay 'auto  ; default is 15s
            gcmh-high-cons-threshold (* 32 1024 1024)
            gcmh-verbose nil)
      (gcmh-mode 1))
  (error (setq gc-cons-threshold (* 16 1024 1024))))

(defvar user-cache-directory "~/.cache/emacs/")
(defvar user-emacs-directory "~/.cache/emacs/")
(use-package no-littering)

(provide 'setup-core)
