{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs";


    };
    outputs = {self, nixpkgs, disko, ...}:{
        nixosConfigurations = {
            "testVM" = nixpkgs.lib.nixosSystem {
                modules = [
                    ./testVM
                    disko.nixosModules.disko
                    {nix.settings.experimental-features = ["nix-command" "flakes"];}
                ];

            };
        };
        devShells."x86_64-linux".default = let
            pkgs = nixpkgs.legacyPackages."x86_64-linux";

        in pkgs.mkShell {
            packages = [
                pkgs.nixos-anywhere
                pkgs.nixos-rebuild
            ];
        };
    };
}