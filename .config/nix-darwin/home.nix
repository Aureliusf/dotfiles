# home.nix

{ config, pkgs, ... }:

{
  home = {
    username = "aure"; 
    homeDirectory = "/Users/aure/";
    stateVersion = "25.05";

    packages = with pkgs; [
      ripgrep
      fzf
      zsh
      git
      neovim
      tmux
      aerospace
      raycast
      _1password-cli
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # If you want to manage your shell (like zsh) with Home Manager
  # programs.zsh = {
  #   enable = true;
  #   enableAutosuggestions = true;
  #   enableSyntaxHighlighting = true;
  #   # ... other zsh options
  # };

  # It's common to define a primary editor here if you use it in Home Manager
  # programs.neovim = {
  #   enable = true;
  #   # ... neovim config
  # };
}
