(push (concat user-emacs-directory "modules") load-path)

(require 'setup-straight)
(require 'setup-core)
;; (require 'setup-daemon)

(require 'setup-themes)
(require 'setup-fonts)
(require 'setup-icons)
(require 'setup-dashboard)
(require 'setup-modeline)

(require 'setup-keybindings)
(require 'setup-ivy)
(require 'setup-help)

(require 'setup-files)
(require 'setup-dirs)
(require 'setup-windows)
(require 'setup-buffers)
(require 'setup-minibuffer)
(require 'setup-toggles)
;;(require 'setup-workspaces)
(require 'setup-projects)
(require 'setup-git)
(require 'setup-tramp)
(require 'setup-term)

(require 'setup-org)
;;(require 'setup-roam)

(require 'setup-prog)
(require 'setup-intellisence)
(require 'setup-formatting)
(require 'setup-commenting)

(require 'setup-lang-fortran)
(require 'setup-lang-cc)
(require 'setup-lang-python)
(require 'setup-lang-scheme)

(require 'setup-nix)

(require 'setup-misc)
