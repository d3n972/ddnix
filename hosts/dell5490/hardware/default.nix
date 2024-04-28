{
  config,
  lib,
  pkgs,
  modulesPath,
  inputs,
  ...
}: {
  imports = [
    ./generated.nix

    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
  ];
}
