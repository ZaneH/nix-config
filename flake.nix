{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    pia.url = "github:Fuwn/pia.nix";
    pia.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      sops-nix,
      pia,
      ...
    }:

    let
      # my machines:
      hostNames = builtins.filter (n: builtins.pathExists ./machines/${n}/default.nix) (
        builtins.attrNames (builtins.readDir ./machines)
      );

      defaultSystem = "x86_64-linux";

      modules = import ./modules;
      mkSpecialArgs = { inherit modules home-manager plasma-manager; };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
      nixosConfigurations = nixpkgs.lib.genAttrs hostNames (
        host:
        nixpkgs.lib.nixosSystem {
          system = defaultSystem;
          modules = [
            ./machines/${host}/default.nix
            sops-nix.nixosModules.sops
            pia.nixosModules.${defaultSystem}.default
          ]
          ++ nixpkgs.lib.optionals (defaultSystem == "x86_64-linux") [
            modules.kde
          ];
          specialArgs = mkSpecialArgs // {
            inherit host;
          };
        }
      );
    };
}
