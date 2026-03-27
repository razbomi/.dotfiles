{
  description = "Dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, darwin, home-manager, catppuccin, ... }:
    let
      mkDarwin = { hostname, username, system ? "aarch64-darwin" }: darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit username; };
        modules = [
          ./hosts/darwin.nix
          home-manager.darwinModules.home-manager
          {
            networking.hostName = hostname;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = {
              imports = [
                catppuccin.homeModules.catppuccin
                (import ./home/home.nix)
              ];
            };
            home-manager.extraSpecialArgs = { inherit username; };
          }
        ];
      };
    in
    {
      darwinConfigurations = {
        henry = mkDarwin { hostname = "henry"; username = "mitko"; };
      };
    };
}
