{
  config,
  pkgs,
  ...
}: {
    users.users.markadonyi.packages = with pkgs; [mupdf];
    xdg.mime.defaultApplications = {
        "application/pdf" = "mupdf.desktop";
    };
}