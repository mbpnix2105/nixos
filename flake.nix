{
  description = "mbpnix";

  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-20.09";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/staging";
  };

  outputs = { self, stable, unstable, home-manager, utils, ... }@inputs:
    utils.lib.systemFlake {
      inherit self inputs;

      channels.nixpkgs = {
        input = unstable;
        config = {
          allowUnfree = true;
        };
      };

      channels.nixpkgs-stable = {
        input = stable;
        config = {
          allowUnfree = true;
        };
      };

      channels.nixpkgs.overlaysBuilder = channels: [
        (final: prev: { inherit (channels) nixpkgs-stable; /* pkgs */ })
      ];

      hosts = {
        nixos = {
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
            }
             ({ pkgs, ... }: {
              home-manager.users.mbpnix = { ... }: { imports = [ ./home/home.nix ]; };
              environment.shellAliases = {
                nix-repl = "nix repl ${inputs.utils.lib.repl}";
              };
            })
          ];
        };
      };

      sharedOverlays = [
        self.overlay
      ];

      overlay = import ./system/overlays/packages.nix;

      hostDefaults.modules = [ utils.nixosModules.saneFlakeDefaults ];
    };
}
