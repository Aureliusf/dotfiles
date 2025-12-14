# flake.nix

{
  description = "Darwin configuration";

  inputs = {
    # Use a specific, stable Nixpkgs channel for better compatibility
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Use a specific, stable branch of nix-darwin
    darwin.url = "github:lnl7/nix-darwin/nix-darwin-25.05";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Homebrew package manager support
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    #
    # Add the mhaeuser/mhaeuser tap battery-toolkit
    mhaeuser-tap = { 
      url = "github:mhaeuser/homebrew-mhaeuser"; 
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, mhaeuser-tap, ... }: { 
    darwinConfigurations = {
      macbook = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # or "x86_64-darwin"
        specialArgs = { inherit inputs; };
        modules = [
          ./.config/nix-darwin/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aure = import ./.config/nix-darwin/home.nix;
            home-manager.backupFileExtension = "backup";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "aure";
              autoMigrate = true;
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
                "mhaeuser/mhaeuser" = mhaeuser-tap;
                # "d12frosted/homebrew-emacs-plus" = homebrew-emacs-plus; # Emacs tap removed
              };
              mutableTaps = false;
            };
          }
        ]; 
      };
    };
  };
}
