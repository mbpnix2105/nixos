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
    grub2
    gptfdisk
    git-crypt
    htop
    keepassxc
    kotatogram-desktop
    nano
    neofetch
    pavucontrol
    gparted
    parted
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
  ]) ++ (with pkgs.gnome3; [
    gnome-disk-utility
  ]);
}
