{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    arduino
    bat
    bc
    etcher
    exa
    gimp-with-plugins
    google-cloud-sdk
    hping
    htop
    i3lock-fancy
    inkscape
    lsd
    nettools
    nmap
    p7zip
    pinentry-gtk2
    procs
    ripgrep
    scrot
    speedtest-cli
    stow
    tree
    unrar
    unzip
    vlc
    xclip
    youtube-dl
  ];
}
