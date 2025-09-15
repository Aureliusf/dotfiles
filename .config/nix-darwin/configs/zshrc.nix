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
    initExtra = ''
      # Carapace completion styling
      zstyle ':completion:*' format 
}

\e[2;37mCompleting %d\e[m'
      zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
    '';
  };

  programs.carapace = {
    enable = true;
    enableZsh = true;
  };
}

