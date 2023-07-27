(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (concat "/home/" (getenv "USER") "/Documents/Records/Notes/journal/"))
  :config
  (setq org-roam-db-location (locate-user-emacs-file "config/roam/org-roam.db"))
  (defvar org-roam-library
    `(,(concat "/home/" (getenv "USER") "/Documents/Records/Notes/journal/")
      ,(concat "/home/" (getenv "USER") "/Documents/Records/Notes/study/")
      ,(concat "/home/" (getenv "USER") "/Documents/Records/Notes/science/")
      ))

  (defun org-roam-checkout ()
    (interactive)
    (let ((ctx org-roam-directory))
      (if (eq (length org-roam-library) 1)
          ;; Still go ahead and set the variable in this case!
          (progn (setq org-roam-directory (car org-roam-library)
                       org-roam-db-location (concat org-roam-directory "org-roam.db"))
                 (message "You only have one choice for org-roam-directory defined."))
        (let ((lib (completing-read "Choose a volume: " org-roam-library)))
          (when lib
            (setq org-roam-directory lib
                  org-roam-db-location (concat org-roam-directory "org-roam.db")))))
      ;; Assuming that the user changes context, let’s rebuild the cache
      ;; and prompt them to choose a new file in that context
      (when (not (eq ctx org-roam-directory))
        (org-roam-db-sync)
        (org-roam-node-find))))

  (defun org-roam-node-insert-immediate (arg &rest args)
    (interactive "P")
    (let ((args (cons arg args))
          (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                    '(:immediate-finish t)))))
      (apply #'org-roam-node-insert args)))

  (org-roam-db-autosync-mode)
  )

;; TODO  kioError
(use-package org-roam-ui
  :after org-roam
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;:hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))



(general-def
  :keymaps '@fenrir/menu-note-map
  :wk-full-keys nil

  "r" '(:prefix-command @fenrir/menu-note-roam
                        :prefix-map @fenrir/menu-note-roam-map
                        :wk "roam")
  )

(general-def
  :keymaps '@fenrir/menu-note-roam-map
  :wk-full-keys nil

  "f" '(org-roam-node-find :which-key "find-roam-node")
  "i" '(org-roam-node-insert-immediate :which-key "insert-roam-node")
  "I" '(org-roam-node-insert :which-key "insert-roam-node")
  "a" '(org-roam-alias-add :which-key "create-roam-alias")
  "l" '(org-roam-buffer-toggle :which-key "load-roam-buffer")
  "c" '(org-id-get-create :which-key "create-roam-id")
  "g" '(org-roam-graph :which-key "show-roam-graph")
  "u" '(org-roam-ui-open :which-key "show-roam-graph")
  "s" '(org-roam-checkout :which-key "select-roam-library"))

(provide 'setup-roam)
