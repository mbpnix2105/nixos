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
    glxinfo
    gparted
    gptfdisk
    grub2
    htop
    keepassxc
    kora-icon-theme
    kotatogram-desktop
    lshw
    nano
    neofetch
    parted
    pavucontrol
    pciutils
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
