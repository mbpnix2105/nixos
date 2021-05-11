{config, pkgs, ...}:

/* machinectl pull-tar --verify=no https://nspawn.org/storage/archlinux/archlinux/tar/image.tar.xz archlinux */

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

