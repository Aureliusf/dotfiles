  # darwin.nix
    { pkgs, ... }: 
    {

      nix.extraOptions = ''
        extra-platforms = x86_64-darwin aarch64-darwin
      '';
      # TouchId for sudo
      security.pam.services.sudo_local.touchIdAuth = true;
      programs.zsh.enable = true;  # default shell on catalina


      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      system = {
        defaults = {
          finder = {
            _FXShowPosixPathInTitle = true; # show full path in finder title
            AppleShowAllExtensions = true; # show all file extensions
            AppleShowAllFiles = true; # show hidden files
            FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
            QuitMenuItem = true; # enable quit menu item
            ShowPathbar = true; # show path bar
            ShowStatusBar = true; # show status bar
          };
        };
      };
      system.primaryUser = "aure";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
