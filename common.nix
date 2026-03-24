# Adapted from streamly-packages/common.nix
{ nixpkgs ? null }:

let
#------------------------------------------------------------------------------
# nixpksg configuration
#------------------------------------------------------------------------------

# IMPORTANT: if you change the commits, change in flake.nix as well.

# see https://channels.nixos.org/nixos-unstable/git-revision
nixpkgsRev = "6c9a78c09ff4d6c21d0319114873508a6ec01655"; # nixos-unstable
nixpkgsDarwinRev = "6c9a78c09ff4d6c21d0319114873508a6ec01655"; # nixos-unstable

nixpkgsOptions =
  {
    config.allowUnfree = true; # Allow unfree packages for some vscode extensions
    config.allowBroken = true;
  };

#------------------------------------------------------------------------------
# nixpack configuration
#------------------------------------------------------------------------------

packName = "nixpack-editors";
packOptions =
  { #inherit compiler;
    #inherit installHoogle;
    #installDocs = true;
  };

# https://github.com/composewell/nixpack repository revision.
nixpackRev = "bebbfc11f153bf3a95c5b9dda4980bf47451bff2";

#------------------------------------------------------------------------------
# Anything after this is usually not to be changed
#------------------------------------------------------------------------------

isDarwin = builtins.match ".*darwin.*" builtins.currentSystem != null;
commit = if isDarwin then nixpkgsDarwinRev else nixpkgsRev;

nixpkgsOrig =
  if nixpkgs != null
  then nixpkgs
  else
    import
      (
        builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/${commit}.tar.gz";
        }
      ) nixpkgsOptions;

basepkgs =
  let
    src =
        builtins.fetchTarball {
          url = "https://github.com/composewell/nixpack/archive/${nixpackRev}.tar.gz";
        };
  in import src;

nixpkgs1 = nixpkgsOrig.extend (self: super: {
  # XXX we may not need this if we are passing basepkgs everywhere
  nixpack = basepkgs.nixpack;
});

in

basepkgs.nixpack.mkEnv
  { nixpkgs = nixpkgs1;
    inherit basepkgs;
    name = packName;
    #sources = import ./sources.nix;
    packages = import ./packages.nix;
  } // packOptions
