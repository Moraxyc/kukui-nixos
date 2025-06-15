{ inputs, lib, ... }:
{
  flake = {
    nixosConfigurations.kukui = lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = lib.singleton ../nixos;
    };
  };
}
