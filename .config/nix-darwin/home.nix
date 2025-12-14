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
lazygit
neovim
tmux
raycast
_1password-cli
zola
nodejs
ghostscript
carapace
];
};
imports = [
./configs/zshrc.nix

];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;
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

programs.ssh = {
enable = true;
matchBlocks = {
"*" = {
extraOptions = {
IdentityAgent = "/Users/aure/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
};
};
};
};

programs.git = {
enable = true;
userName = "Aure";
userEmail = "aurelio@florezdelvalle.com";
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
