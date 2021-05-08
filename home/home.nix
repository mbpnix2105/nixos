{ config, pkgs, ... }:

{
  imports = [
    ./modules/neovim.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mbpnix";
  home.homeDirectory = "/home/mbpnix";

  home.stateVersion = "21.05";
  
  xdg.enable = true;
}
