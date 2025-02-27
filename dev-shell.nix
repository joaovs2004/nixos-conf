{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "dev-shell";
  targetPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
    python3
    nodejs
    rustc
    cargo
    gcc
    alsa-lib.dev
    udev
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcursor
    libXrandr
  ]);
  multiPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
  ]);
  runScript = "zsh";
}).env
