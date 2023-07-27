(general-def
    :keymaps '@fenrir/menu-toggle-map
    :wk-full-keys nil

    "t" '(counsel-load-theme :wk "theme")
    "f" '(toggle-frame-fullscreen :wk "fullscreen")
    )

(provide 'setup-toggles)
