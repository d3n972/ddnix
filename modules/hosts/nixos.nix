{ config, lib, pkgs, ... }:

{
    imports = [
    ../home
    ../home/backup.nix
    ];
    hardware.enableRedistributableFirmware = true;
    networking.hostName = "nixos";
    # environment.systemPackages = with pkgs; [ steam light ];
}