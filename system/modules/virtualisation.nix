{config, pkgs, ...}:

{
  systemd.targets.machines.enable = true;
  systemd.nspawn."archlinux" = {
    enable = true;
    execConfig = {
      Boot = true;
    };
    networkConfig = {
      Private = false;
    };
  };
  systemd.services."systemd-nspawn@archlinux" = {
    enable = true;
    wantedBy = [ "machines.target" ];
  };
}

