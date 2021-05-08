{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    arc-icon-theme
    arc-theme
    bleachbit
    brave
    capitaine-cursors
    curl
    discord
    exa
    firefox
    git
    git-crypt
    htop
    keepassxc
    kotatogram-desktop
    nano
    neofetch
    pavucontrol
    rsync
    sweet
    sxiv
    tree
    ueberzug
    vim
    wget
    xclip
    xsel
  ] ++ (with pkgs.xorg; [
    xkill
  ]);
}
