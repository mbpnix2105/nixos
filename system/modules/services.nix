{ config, pkgs, ... }:

{
  services.fstrim = {
    enable = true;
    interval = "daily";
  };

  services.journald.extraConfig = "Storage=volatile";
}
