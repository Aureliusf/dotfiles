# .config/nix-darwin/configs/zshrc.nix
{
  config,
  pkgs,
  ...
}:
#ZSH
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      update = "sudo darwin-rebuild switch --flake ~/dotfiles#macbook";
      nv = " nvim";
      pipes = "pipes.sh -t 3";
      zshrc = " nvim ~/dotfiles/.config/nix-darwin/configs/zshrc.nix";
      ll = "eza -a --icons --color=always --group-directories-first";
      l = "eza -alh --color=always";
      nvimlua = " nvim ~/.config/nvim/init.lua";
      list = " eza -a --icons --color=always --group-directories-first --tree -L 2";
      rsync-FIU = "rsync -avP --delete /Users/aure/Documents/FIU /Volumes/aure/obsidian/FIU";
      rsync-dotfiles = "rsync -avP --delete /Users/aure/dotfiles/ /Volumes/aure/dotfiles/mac/dotfiles";
      rsync-projects = "rsync -avP /Users/aure/projects/ /Volumes/aure/projects/";
      AI-claude = "nix-shell ~/projects/claude-nix --command claude";
      AI-gemini = "nix-shell ~/projects/gemini-cli";
      AI-open = "nix-shell ~/projects/opencode";

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

