# nvim and vscodium editors

A ready-to-use Nix shell environment with nvim and vscodium editors.
**Includes:**

* `nvim`: Stylish Vim IDE with plugins
* `codium`: Visual Studio Code with extensions

The version of `nixpkgs` can be changed in the [default.nix](default.nix) or
[flake.nix](flake.nix) files whichever you use.

# Starting a Nix Shell

There are two ways to start the nix shell.

## Directly using github URL

To get a shell with the development environment installed in it, use the
following command:

```
nix-shell https://github.com/composewell/nixpack-editors/archive/master.tar.gz
```

## By cloning the github repo

You can clone the `nixpack-editors` repo and run `nix-shell`
command from the repo root directory.

```
git clone https://github.com/composewell/nixpack-editors
cd nixpack-editors
nix-shell
```

You can comment out any packages you do not need in
[packages.nix](packages.nix).

# Installing the packages

If you want to permanently install the packages in your nix profile:

```
nix-env -i -f https://github.com/composewell/nixpack-editors/archive/master.tar.gz
```

# Using vim editor

Inside the nix shell, run the following command:

```
nvim
```

Use `ESC :q` to quit.
Use `,h` for help.
Use `:colorscheme morning` if you want a light theme.

To customize vim plugins edit the [nix/vim/plugins.nix](nix/vim/plugins.nix) file.

# Using VSCode editor

To run VSCodium, the open source version of Microsoft VSCode, run the
following command in the nix-shell:

```
codium
```

To customize vscode extensions edit the [nix/vscodium/extensions.nix](nix/vscodium/extensions.nix) file.
