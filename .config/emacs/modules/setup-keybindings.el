(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :straight t
  :demand t
   :commands (general-def general-define-key)
   :init
   (defvar general-leader "SPC"
     "Leader key for Evil")
   (defvar general-leader-global "C-c"
     "Leader key for Emacs and Evil Insert states")

   (general-define-key
    :states '(normal visual emacs)
    :prefix general-leader
    :non-normal-prefix general-leader-global
    :global-prefix general-leader-global
    :prefix-command '@fenrir/menu
    :prefix-map '@fenrir/menu-map
    :wk "Leader key for emacs")

   (general-create-definer @fenrir/leader-key
     :states '(normal visual motion emacs)
     :prefix general-leader
    :global-prefix general-leader-global
     :non-normal-prefix general-leader-global)

   (general-def
     :states '(motion)
     :global-prefix general-leader-global
     :prefix general-leader-global
     "" '@fenri/menu))

(use-package evil
  :demand t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)

  :hook
  (evil-mode . @fenrir/evil-hook)

  :config

  (defun @fenrir/evil-hook ()
    (dolist (mode '(custom-mode
                    eshell-mode
                    git-rebase-mode
                    erc-mode
                    circle-server-mode
                    circle-chat-mode
                    circle-query-mode
                    sauron-mode
                    term-mode
                    vterm-mode
                    eshell-mode))
      (add-to-list 'evil-emacs-state-modes mode)))

  (evil-mode 1)

  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(push (concat user-emacs-directory "packages/straight/build") load-path)

;;(load "general/general")
(require 'general)

;;(load "evil/evil")
(require 'evil)

(general-def
    :keymaps '@fenrir/menu-map
    :wk-full-keys nil

    "x" '(Control-X-prefix :wk "C-x map")
    "w" '(evil-window-map :wk "window")
    "<tab>" '(persp-key-map :wk "workspace")
    "z" '(repeat-complex-command :wk "M-x again")
    "x" '(execute-extended-command :wk "M-x")
    "g" '(vc-prefix-map :wk "git/vc")
    "h" '(help-map :wk "help")
    "p" '(projectile-command-map :wk "project")) 

(general-def
    :keymaps '@fenrir/menu-map
    :wk-full-keys nil

    "f" '(:prefix-command @fenrir/menu-file
                          :prefix-map @fenrir/menu-file-map
                          :wk "file")
    "q" '(:prefix-command @fenrir/menu-quit
                          :prefix-map @fenrir/menu-quit-map
                          :wk "quit")
    "s" '(:prefix-command @fenrir/menu-search
                          :prefix-map @fenrir/menu-search-map
                          :wk "search")
    "b" '(:prefix-command @fenrir/menu-buffer
                          :prefix-map @fenrir/menu-buffer-map
                          :wk "buffer")
    "t" '(:prefix-command @fenrir/menu-toggle
                          :prefix-map @fenrir/menu-toggle-map
                          :wk "toggle")
    "n" '(:prefix-command @fenrir/menu-note
                          :prefix-map @fenrir/menu-note-map
                          :wk "note"))

(general-def
  :keymaps '@fenrir/menu-quit-map
  :wk-full-keys nil
  "q" '(save-buffers-kill-terminal :wk "quit emacs (eject!)")
  "f" '(delete-frame               :wk "quit frame")
  "d" '(server-edit                :wk "done with buffer"))

(provide 'setup-keybindings)
