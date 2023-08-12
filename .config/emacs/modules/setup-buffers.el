(use-package bufler
  :ensure t
  :config
  (setf bufler-groups
        (bufler-defgroups
         ;; Subgroup collecting all named workspaces.
         (group (auto-workspace))
         ;; Subgroup collecting buffers in a projectile project.
         (group (auto-projectile))
         ;; Grouping browser windows
         (group
          (group-or "Browsers"
                    (name-match "Vimb" (rx bos "vimb"))
                    (name-match "Qutebrowser" (rx bos "Qutebrowser"))
                    (name-match "Chromium" (rx bos "Chromium"))))
         (group
          (group-or "Chat"
                    (mode-match "Telega" (rx bos "telega-"))))
         (group
          ;; Subgroup collecting all `help-mode' and `info-mode' buffers.
          (group-or "Help/Info"
                    (mode-match "*Help*" (rx bos (or "help-" "helpful-")))
                    ;; (mode-match "*Helpful*" (rx bos "helpful-"))
                    (mode-match "*Info*" (rx bos "info-"))))
         (group
          ;; Subgroup collecting all special buffers (i.e. ones that are not
          ;; file-backed), except `magit-status-mode' buffers (which are allowed to fall
          ;; through to other groups, so they end up grouped with their project buffers).
          (group-and "*Special*"
                     (name-match "**Special**"
                                 (rx bos "*" (or "Messages" "Warnings" "scratch" "Backtrace" "Pinentry") "*"))
                     (lambda (buffer)
                       (unless (or (funcall (mode-match "Magit" (rx bos "magit-status"))
                                            buffer)
                                   (funcall (mode-match "Dired" (rx bos "dired"))
                                            buffer)
                                   (funcall (auto-file) buffer))
                         "*Special*"))))
         (auto-mode))))

(use-package uniquify
  :straight nil
  :init (setq uniquify-buffer-name-style 'forward))

(general-def
  :keymaps '@fenrir/menu-buffer-map
  :wk-full-keys nil

  "B" '(bufler-list :which-key "find-buffer")
  "b" '(bufler-workspace-switch-buffer :which-key "find-buffer")
  "i" '(ibuffer :which-key "open-ibuffer")
  "k" '(kill-current-buffer :which-key "kill-buffer")
  "s" '(save-buffer :which-key "save-buffer")
  "s" '(eval-buffer :which-key "evaluate-buffer")
  "l" '(next-buffer :which-key "next-buffer")
  "h" '(previous-jump :which-key "previous-buffer"))

(evil-collection-define-key 'normal 'bufler-list-mode-map
  (kbd "RET") 'bufler-list-buffer-switch
  (kbd "M-RET") 'bufler-list-buffer-peek
  "D" 'bufler-list-buffer-kill)

(provide 'setup-buffers)
