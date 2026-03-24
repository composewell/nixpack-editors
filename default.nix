{
nixpkgs ? import

#------------------------------------------------------------------------------
# Modify the commit in this line to change the nixpkgs version
#------------------------------------------------------------------------------

(
let
  commit =
    if builtins.match ".*darwin.*" builtins.currentSystem != null
    # use https://channels.nixos.org/nixpkgs-25.05-darwin/git-revision
    then "6c9a78c09ff4d6c21d0319114873508a6ec01655"
    #stan fails to build for macOS on this one
    #then "branch-off-24.11" # nixpkgs 24.11
    # use https://channels.nixos.org/nixpkgs-25.05/git-revision
    #else "b2a3852bd078e68dd2b3dfa8c00c67af1f0a7d20";
    #else "50ab793786d9de88ee30ec4e4c24fb4236fc2674"; # nixpkgs 24.11
    #else "branch-off-24.11"; # nixpkgs 24.11
    else "6c9a78c09ff4d6c21d0319114873508a6ec01655";
in
  builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${commit}.tar.gz";
  }
)

#------------------------------------------------------------------------------
# nixpkgs options
#------------------------------------------------------------------------------

{
  config.allowUnfree = true; # Allow unfree packages for some vscode extensions
  config.allowBroken = true;
}

}:
let src =
      builtins.fetchTarball {
        url = "https://github.com/composewell/nixpack/archive/e7d9952542b49e22ec9dde9f67cc7a559b047334.tar.gz";
      };
    nixpack = import "${src}/nix";

    nixpkgs1 = nixpkgs.extend (self: super: {
      nixpack = nixpack;
    });

    env =
      nixpack.mkEnv
        { nixpkgs = nixpkgs1;
          name = "nixpack-editors";
          packages = import ./packages.nix;
          isDev = true;
        };
in if nixpkgs.lib.inNixShell
   then env.shell
   else env.env
