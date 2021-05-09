{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;
    matchBlocks =
      let
        home = config.home.homeDirectory;
      in
      {
        "github.com" = {
          user = "git";
          identityFile = "${home}/.ssh/key.pub";
          identitiesOnly = true;
        };
      };
  };
  
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    settings = { PASSWORD_STORE_DIR = ".password-store"; };
  };

  programs.gpg = {
    enable = true;
    settings = { homedir = ".gnupg"; };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 60;
    defaultCacheTtlSsh = 60;
    maxCacheTtl = 60;
    maxCacheTtlSsh = 60;
    pinentryFlavor = "gtk2";
    sshKeys = [ "6F108BEA85A44CEE1495B3626F668D412CAF081D" ];
  };
}
