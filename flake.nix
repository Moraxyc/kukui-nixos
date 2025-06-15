{
  description = "NixOS for Chromebook kukui";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    mt81xx-kernel = {
      url = "github:hexdump0815/linux-mainline-mediatek-mt81xx-kernel";
      flake = false;
    };
    kernel-config-options = {
      url = "github:hexdump0815/kernel-config-options";
      flake = false;
    };
    kernel-extra-patches = {
      url = "github:hexdump0815/kernel-extra-patches";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        imports =
          ./flake-modules
          |> lib.fileset.fileFilter (file: file.hasExt "nix" && !lib.hasPrefix "_" file.name)
          |> lib.fileset.toList;

        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
      }
    );
}
