# flake.nix - just the outputs section
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
    zig.url = "github:mitchellh/zig-overlay";
    zig.inputs.nixpkgs.follows = "nixpkgs";
    apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
    apple-silicon.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    sops-nix,
    zig,
    apple-silicon,
    ...
  }:

  let
    # my machines:
    hostNames = builtins.filter (n: builtins.pathExists ./machines/${n}/default.nix) (
      builtins.attrNames (builtins.readDir ./machines)
    );

    # Map hostnames to their architectures
    hostArchitectures = {
      nixos = "x86_64-linux";
      mba = "aarch64-linux";
    };

    modules = import ./modules;
    mkSpecialArgs = { inherit modules home-manager plasma-manager; }; # plasma-manager is here

    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in
  {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt;
    
    nixosConfigurations = nixpkgs.lib.genAttrs hostNames (
      host:
      let
        system = hostArchitectures.${host} or "x86_64-linux";
        isAppleSilicon = host == "mba";
      in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./machines/${host}/default.nix
          sops-nix.nixosModules.sops
          {
            nixpkgs.overlays = [ zig.overlays.default ];
          }
        ]
        ++ nixpkgs.lib.optionals isAppleSilicon [
          apple-silicon.nixosModules.apple-silicon-support
        ];
        specialArgs = mkSpecialArgs // {
          inherit host;
        };
      }
    );
  };
}