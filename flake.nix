{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }:

  let
    # my machines:
    hostNames = builtins.filter
                      (n: builtins.pathExists ./machines/${n}/default.nix)
                      (builtins.attrNames (builtins.readDir ./machines));

    defaultSystem = "x86_64-linux";

    modules       = import ./modules;
    mkSpecialArgs = { inherit modules home-manager plasma-manager; };

    systems       = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
  in
  {
    nixosConfigurations = nixpkgs.lib.genAttrs hostNames (host:
      nixpkgs.lib.nixosSystem {
        system     = defaultSystem;
        modules    = [ ./machines/${host}/default.nix ]
                     ++ nixpkgs.lib.optionals (defaultSystem == "x86_64-linux") [ modules.kde ];
        specialArgs = mkSpecialArgs // { inherit host; };
      });
  };
}
