{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "dev-shell";
  targetPkgs = pkgs: (with pkgs; [
    alsa-lib
    python3
    nodejs
    rustc
    cargo
    gcc
    alsa-lib.dev
    libudev-zero
    libxkbcommon
    vulkan-loader
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcursor
    libXrandr
    libXi
    libXrandr
  ]);
  multiPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
  ]);
  runScript = "zsh";
}).env
