# flake.nix

{
  description = "Darwin configuration";

  inputs = {
    # Use a specific, stable Nixpkgs channel for better compatibility
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Changed from nixos-unstable

    # Use a specific, stable branch of nix-darwin
    darwin.url = "github:lnl7/nix-darwin/nix-darwin-25.05"; # This is often more stable with releases
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05"; # Match Home Manager to Nixpkgs version
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      macbook = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # or "x86_64-darwin"
        specialArgs = { inherit inputs; }; # It's good practice to pass inputs if you use them in modules
        modules = [
          ./.config/nix-darwin/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aure = import ./.config/nix-darwin/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}
