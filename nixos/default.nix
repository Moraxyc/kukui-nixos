_: {
  imports = [
    ./kernel
    ./modules/cros-sd-image.nix
    ./modules/hardware-config.nix
  ];

  system.stateVersion = "25.05";
}
