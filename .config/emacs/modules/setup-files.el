(use-package cus-edit
  :straight nil
  :config
  ;; Get custom-set-variables out of init.el
  (defvar @fenrir/custom-file (concat user-emacs-directory "config/custom.el"))
  (setq custom-file @fenrir/custom-file)

  (defun @fenrir/cus-edit ()
    (let ((file @fenrir/custom-file))
      (unless (file-exists-p file)
        (make-empty-file file))
      (load-file file)))
  :hook (after-init . @fenrir/cus-edit))

(setq auto-save-interval 2400)
(setq auto-save-timeout 300)

(setq auto-save-list-file-prefix
      (concat user-cache-directory "auto-save-list/.saves-"))

(setq backup-directory-alist
      `(("." . ,(concat user-cache-directory "backup")))
      backup-by-copying t ; Use copies
      version-control t ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 10 ; Newest versions to keep
      kept-old-versions 5 ; Old versions to keep
      )

(use-package recentf
  :straight t
  :config
  (setq recentf-save-file (concat user-cache-directory "recentf")
        recentf-max-saved-items 200
        recentf-auto-cleanup 300)
  (recentf-mode 1))

(global-auto-revert-mode 1)
(save-place-mode nil)

(use-package undo-tree
  :straight t
  :ensure t
  :init
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode 1))

(provide 'setup-files)
