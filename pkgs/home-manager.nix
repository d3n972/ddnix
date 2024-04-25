{
  config,
  pkgs,
  ...
}: {
    users.users.markadonyi.packages = with pkgs; [home-manager];
}