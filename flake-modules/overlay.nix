{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];

  perSystem = _: {
    overlayAttrs = {
      allow-missing-kmodules = final: super: {
        makeModulesClosure = x: super.makeModulesClosure (x // { allowMissing = true; });
      };
    };
  };
}
