{ config, pkgs, ... }:
{
  services.emacs = {
    enable = true;
    package = pkgs.unstable.emacs29-pgtk;
  };
  
  environment.systemPackages = with pkgs; [
    ((emacsPackagesFor unstable.emacs29-pgtk).emacsWithPackages (epkgs: with epkgs; [
      
      # # Dashboard
      # dashboard

      # # Themes
      # modus-themes
      # catppuccin-theme
      # no-littering

      # # Nix
      # nix-mode

      # # Git
      # magit
      # #evil-magit

      # # Org
      # org
      # org-superstar
      # org-modern
      # mixed-pitch
      # org-auto-tangle
      # org-appear

      # # Ivy
      # counsel
      # ivy
      # ivy-rich
      # ivy-prescient

      # # Dirs
      # diredfl
      # #dired
      # dired-single
      # dirvish
      # openwith
      # treemacs
      # treemacs-all-the-icons

      # # Misc
      # #explain-pause-mode
      # rainbow-delimiters

      # # Term
      vterm

      # # Prog
      # paredit
      # #paren
      # #ansi-color
      
      # # Roam
      # org-roam
      # org-roam-ui

      # # Help
      # which-key
      # helpful
      
      # # Font
      # ligature

      # # Files
      # #cus-edit
      # #recentf
      # undo-tree

      # # Icons
      # all-the-icons
      # nerd-icons

      # # C
      # #cc-mode
      # cmake-mode
      # cmake-font-lock
      # glsl-mode
      # #dap-lldb
   
      # # Buffer
      # bufler
      # #uniquify

      # # Modeline
      # doom-modeline

      # # Projects
      # projectile
      # counsel-projectile

      # # Minibuffer
      # #minibuffer
      # #savehist

      # # Formatting
      # format-all
      # evil-nerd-commenter
      
      # # Workspaces
      # persp-mode

      # # Keys
      # general
      # evil
      # evil-collection

      # # Scheme
      # geiser-guile
      # lsp-pyright
      # jupyter
      # python

      # # Rust
      # rustic
      
      # # LSP
      # lsp-mode
      # lsp-ui
      # lsp-ivy
      # lsp-treemacs
      # dap-mode
      # company
      
    ]))
  ];
}
