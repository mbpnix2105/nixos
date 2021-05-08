{ config, pkgs, ... }:

{
  nix = {
    # package = pkgs.nixUnstable;
    # extraOptions = ''
    #   experimental-features = nix-command flakes ca-references
    # '';
    useSandbox = true;
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    binaryCaches = [
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://nix-community.cachix.org"
      "https://fufexan.cachix.org"
      "https://mbpnix.cachix.org"
    ];
    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
      "mbpnix.cachix.org-1:nAfBijPdJRqcMhwDlIr4LbwPPKVWHROKx02Bcc/WbAI="
    ];
    trustedUsers = [ "root" "mbpnix" ];
  };
}
