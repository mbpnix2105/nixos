{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    bleachbit
    brave
    capitaine-cursors
    curl
    discord
    exa
    firefox
    git
    git-crypt
    gparted
    gptfdisk
    grub2
    htop
    keepassxc
    kora-icon-theme
    kotatogram-desktop
    nano
    neofetch
    parted
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
  ]) ++ (with pkgs.gnome3; [
    gnome-disk-utility
  ]);
}
