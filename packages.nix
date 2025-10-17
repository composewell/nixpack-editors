{nixpkgs}:
let editors = (import ./nix) {nixpkgs = nixpkgs;};
in
{
  packages =
    [ editors.nvimWithConfig
      editors.vim_bashrc
      editors.vim_gitconfig
      editors.vscodiumWithConfig
    ];
  libraries = [];
}
