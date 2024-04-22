{ config, pkgs, ... }:
{
users.users.markadonyi = {
    isNormalUser = true;
    description = "markadonyi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      spotify
      google-chrome
      discord
      vscode
      vim
      podman
      jq
      _1password
      _1password-gui
      nodejs_21
      nodePackages.node-gyp
      git
      file
    ];
  };
}