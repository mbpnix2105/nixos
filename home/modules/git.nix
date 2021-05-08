{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "mbpnix2105";
    userEmail = "mbpnix2105@protonmail.com";
#    signing = {
#      signByDefault = true;
#      key = "72DAFC99";
#    };
    extraConfig = {
      core.editor = "vim";
      github.username = "mbpnix2105";
      color.ui = true;
      pull.rebase = true;
      diff.algorithm = "patience";
    };
  };
}
