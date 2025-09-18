# .config/nix-darwin/configs/zshrc.nix
{
  configs,
  pkgs,
  ...
}:
#ZSH
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      update = "sudo darwin-rebuild switch --flake .#macbook";
      nv = " nvim";
      pipes = "pipes.sh -t 3";
      zshrc = " nvim ~/.zshrc";
      ll = "eza -a --icons --color=always --group-directories-first";
      l = "eza -alh --color=always";
      nvimlua = " nvim ~/.config/nvim/init.lua";
      list = " eza -a --icons --color=always --group-directories-first --tree -L 2";
      rsync-FIU = "rsync -av --delete /Users/aure/Documents/FIU /Volumes/aure/obsidian/FIU";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "tmux"
        "1password"
        "colorize"
        "vi-mode"
      ];
      theme = "awesomepanda";
    };

    # Carapace configuration
    sessionVariables = {
      CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
    };
  };

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };
}

