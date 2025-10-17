{
  description = "Editors with config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/branch-off-24.11";
    #nixpkgs.url = "github:NixOS/nixpkgs/b2a3852bd078e68dd2b3dfa8c00c67af1f0a7d20"; # nixpkgs-25.05
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/c3d456aad3a84fcd76b4bebf8b48be169fc45c31"; # nixpkgs-25.05-darwin
    #nixpack.url = "path:.";
    nixpack.url = "github:composewell/nixpack/85e696d04ffdcc9c76106506e6cec35d5b44b656";
  };

  outputs = { self, nixpkgs, nixpkgs-darwin, nixpack }:
    nixpack.flakeOutputs {
      inherit nixpkgs;
      inherit nixpkgs-darwin;
      nixpkgsOptions = {
            config.allowUnfree = true;
            config.allowBroken = true;
          };
      envOptions = {
            name = "nixpack-editors-flake";
            packages = import ./packages.nix;
            isDev = true;
      };
    } // { inherit nixpack;} ;
}
