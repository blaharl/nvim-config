{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage (
  {
    stdenv,
    mkShell,
    rustup,
    rustPlatform,
    luarocks,
  }:
  mkShell {
    strictDeps = true;
    nativeBuildInputs = [
      rustup
      rustPlatform.bindgenHook
    ];
    # libraries here
    buildInputs =
      [
      ];
    shellHook = ''
    '';
  }
) { }
