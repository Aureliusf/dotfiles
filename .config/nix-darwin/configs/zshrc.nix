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
      update = "sudo nixos-rebuild switch --flake /home/aure/dotfiles/nixos";
      nv = " nvim";
      pipes = "pipes.sh -t 3";
      zshrc = " nvim ~/.zshrc";
      ll = "eza -a --icons --color=always --group-directories-first";
      l = "eza -alh --color=always";
      nvimlua = " nvim ~/.config/nvim/init.lua";
      list = " eza -a --icons --color=always --group-directories-first --tree -L 2";
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
  };
}

