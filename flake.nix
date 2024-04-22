{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ({lib, ...}: {
            nixpkgs.config.allowUnfree = true;
            nix.settings = {
            # Enable flakes and new 'nix' command
            experimental-features = "nix-command flakes";
            # Deduplicate and optimize nix store
            auto-optimise-store = true;
          };
          })
          ({lib, pkgs, ...}: {
            fonts.packages = with pkgs; [
              noto-fonts
              noto-fonts-cjk
              noto-fonts-emoji
              liberation_ttf
              fira-code
              fira-code-symbols
            ];
          })
        ./modules/home/markadonyi.nix
        ./configuration.nix
      ];
    };
  };
}