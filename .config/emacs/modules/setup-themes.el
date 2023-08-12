(use-package modus-themes
  :ensure t
  :config

  (setq modus-vivendi-palette-overrides
        '((bg-mode-line-active bg-main)
          (fg-mode-line-active fg-main)
          (border-mode-line-active bg-inactive)
          (bg-mode-line-inactive bg-main)
          (fg-mode-line-inactive fg-dim)

          (fg-line-number-inactive fg-dim)
          (fg-line-number-active fg-main)
          (bg-line-number-inactive bg-main)
          (bg-line-number-active bg-main)

          (bg-tab-bar "#000000")
          (bg-tab-current "#000000")
          (bg-tab-other "#000000")

          (fringe "#000000")
        ))

  (defun @fenrir/modus-vivendi ()
    (interactive)
    (load-theme 'modus-vivendi :no-confirm)
    (set-face-background 'header-line "#000000")
    (set-face-foreground 'header-line "#ffffff")
    )

  (setq modus-operandi-palette-overrides
        '((bg-mode-line-active bg-main)
          (fg-mode-line-active fg-main)
          (border-mode-line-active bg-inactive)
          (bg-mode-line-inactive bg-main)
          (fg-mode-line-inactive fg-dim)

          (fg-line-number-inactive fg-dim)
          (fg-line-number-active fg-main)
          (bg-line-number-inactive bg-main)
          (bg-line-number-active bg-main)

          (bg-tab-bar "#ffffff")
          (bg-tab-current "#ffffff")
          (bg-tab-other "#ffffff")

          (fringe "#ffffff")
          ))

  (defun @fenrir/modus-operandi ()
    (interactive)
    (load-theme 'modus-operandi :no-confirm)
    (set-face-background 'header-line "#ffffff")
    (set-face-foreground 'header-line "#000000")
    )
  )


(use-package catppuccin-theme
  :config
  (defun @fenrir/catppuccin-frappe ()
    (interactive)
    (load-theme 'catppuccin :no-confirm)
    (setq catppuccin-flavor 'frappe) ;; or 'latte, 'macchiato, or 'mocha
    (catppuccin-reload))

  (defun @fenrir/catppuccin-latte ()
    (interactive)
    (load-theme 'catppuccin :no-confirm)
    (setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha
    (catppuccin-reload))

  (defun @fenrir/catppuccin-macchiato ()
    (interactive)
    (load-theme 'catppuccin :no-confirm)
    (setq catppuccin-flavor 'macchiato) ;; or 'latte, 'macchiato, or 'mocha
    (catppuccin-reload))

  (defun @fenrir/catppuccin-mocha ()
    (interactive)
    (load-theme 'catppuccin :no-confirm)
    (setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
    (catppuccin-set-color 'base "#000000") 
    (catppuccin-reload))
  )

;;(@fenrir/modus-vivendi)
;;(@fenrir/modus-operandi)

;;(@fenrir/catppuccin-frappe)
;;(@fenrir/catppuccin-latte)
;;(@fenrir/catppuccin-macchiato)
(@fenrir/catppuccin-mocha)

(defun @fenrir/enable-transparency ()
  (interactive)
  (set-frame-parameter nil 'alpha-background 20)
  (add-to-list 'default-frame-alist '(alpha-background . 20)))

(defun @fenrir/disable-transparency ()
  (interactive)
  (set-frame-parameter nil 'alpha-background 100)
  (add-to-list 'default-frame-alist '(alpha-background . 100)))

(@fenrir/disable-transparency)
;;(@fenrir/enable-transparency)

(provide 'setup-themes)
