{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/security.nix
      ./modules/xserver.nix
      ./modules/sound.nix
      ./modules/fonts.nix
      ./modules/gtk.nix
      ./modules/nix.nix
      ./modules/zsh.nix
      ./modules/qt.nix
      ./config.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bucharest";

  networking.useDHCP = false;
  networking.interfaces.enp0s20u2.useDHCP = true;
  networking.interfaces.enp8s0.useDHCP = true;
  networking.interfaces.wlp9s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  nixpkgs.overlays = [
    (import ./overlays/packages.nix)
  ];

  users.users.mbpnix = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
    description = "MBPNIX";
    group = "mbpnix";
    hashedPassword = "$6$kG3gtSGrJ$xXX8NtkaqXOeZxQ7fM.ACgYnj2CdjqOXqC2Qx7Hz9SujOLGn5eN84.knx3Jpl7RTxTthHpAu7Alb92WvzQJ/30";
    shell = pkgs.zsh;
  };

  users.groups.mbpnix = {
    name = "mbpnix";
    gid = 1000;
  };

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "21.05";

  hardware.cpu.intel.updateMicrocode = true;

  environment.shells = [ pkgs.zsh ];
}
