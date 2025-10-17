{nixpkgs}:
let editors = (import ./nix) {nixpkgs = nixpkgs;};
in
{
  packages = [ editors.nvimWithConfig editors.vscodiumWithConfig ];
  libraries = [];
}
