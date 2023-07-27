(use-package diredfl
  :ensure t
  :hook
  ((dired-mode . diredfl-mode)
   ;; highlight parent and directory preview as well
   (dirvish-directory-view-mode . diredfl-mode))
  :config
  (set-face-attribute 'diredfl-dir-name nil :bold t))

(use-package dired
  :straight nil
  :custom
  ((dired-listing-switches "-agho --group-directories-first")))

(use-package dired-single
  :ensure t)

(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("D" "/Documents/"                 "Documents")
     ("a" "/media/data/"                "Data")
     ("t" "~/.local/share/Trash/files/" "Trash")))
  :config
  (setq dirvish-use-header-line 'global)
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  (setq dirvish-preview-dispatchers
        (cl-substitute 'pdf-preface 'pdf dirvish-preview-dispatchers))

  (setq dirvish-attributes
        '(vc-state subtree-state all-the-icons collapse git-msg file-time file-size))

  (setq dired-mouse-drag-files t)                   ; added in Emacs 29
  (setq mouse-drag-and-drop-region-cross-program t) ; added in Emacs 29
  (setq mouse-1-click-follows-link nil)
  (define-key dirvish-mode-map (kbd "<mouse-1>") 'dirvish-subtree-toggle-or-open)
  (define-key dirvish-mode-map (kbd "<mouse-2>") 'dired-mouse-find-file-other-window)
  (define-key dirvish-mode-map (kbd "<mouse-3>") 'dired-mouse-find-file)

  )

(use-package openwith
  :ensure t
  :config
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv"))
               "clementine"
               '(file))
         (list (openwith-make-extension-regexp
                '("xbm" "pbm" "pgm" "ppm" "pnm"
                  "png" "gif" "bmp" "tif" "jpeg")) 
               "feh"
               '(file))
         (list (openwith-make-extension-regexp
                '("mp4" "mkv" "webm" "mov"))
               "mpv"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf"))
               "okular"
               '(file)))))

(use-package treemacs-all-the-icons
  :ensure t)

(use-package treemacs
  :ensure t
  :init
  (treemacs-load-theme "all-the-icons"))

(general-def
  :keymaps '@fenrir/menu-file-map
  :wk-full-keys nil

  "f" '(counsel-find-file :which-key "find-file")
  "P" '(@fenrir/config-directory :which-key "open-user-config")
  "D" '(delete-file :which-key "delete-file")
  "s" '(save-buffer :which-key "save-file")
  "d" '(dired-jump :which-key "open-in-dired")
  "." '(counsel-find-file :which-key "find-file")
  "d" '(:prefix-command @fenrir/menu-file-dirvish
                        :prefix-map @fenrir/menu-file-dirvish-map
                        :wk "dirvish")
  )

(general-def
  :keymaps '(@fenrir/menu-file-dirvish-map dirvish-mode-map)
  :wk-full-keys nil

  "d"   '(dirvish                     :wk "dirvish")
  "a"   '(dirvish-quick-access        :wk "quick-access")
  "f"   '(dirvish-file-info-menu      :wk "file-info-menu")
  "y"   '(dirvish-yank-menu           :wk "yank-menu")
  "N"   '(dirvish-narrow              :wk "narrow")
  "^"   '(dirvish-history-last        :wk "history-last")
  "h"   '(dirvish-history-jump        :wk "history-jump") ; remapped `describe-mode'
  "s"   '(dirvish-quicksort           :wk "quicksort")    ; remapped `dired-sort-toggle-or-edit'
  "v"   '(dirvish-vc-menu             :wk "vc-menu")      ; remapped `dired-view-file'
  "TAB" '(dirvish-subtree-toggle      :wk "subtree-toggle")
  "M-f" '(dirvish-history-go-forward  :wk "history-go-forward")
  "M-b" '(dirvish-history-go-backward :wk "history-go-backward")
  "M-l" '(dirvish-ls-switches-menu    :wk "ls-switches-menu") 
  "M-m" '(dirvish-mark-menu           :wk "mark-menu")
  "M-t" '(dirvish-layout-toggle       :wk "layout-toggle")
  "M-s" '(dirvish-setup-menu          :wk "setup-menu")
  "M-e" '(dirvish-emerge-menu         :wk "emerge-menu")
  "M-j" '(dirvish-fd-jump             :wk "fd-jump")
 )

(evil-define-key 'normal dirvish-mode-map "q" 'dirvish-quit)

(provide 'setup-dirs)
