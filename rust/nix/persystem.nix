{ pkgs, ... }:
let
  devShell = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      rustToolchain
      just
    ];

    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    RUST_BACKTRACE = "full";
  };

  cargoToml = builtins.fromTOML (builtins.readFile ../Cargo.toml);

  rustToolchain = pkgs.symlinkJoin {
    name = "rustToolchain";
    paths = with pkgs; [
      rustc
      cargo
      cargo-watch
      rust-analyzer
      rustPlatform.rustcSrc
    ];
  };
in
{
  devShells = {
    default = devShell;
  };

  packages = {
    default = pkgs.rustPlatform.buildRustPackage {
      inherit (cargoToml.package) name version;
      src = ../.;
      cargoLock.lockFile = ../Cargo.lock;
    };
  };
}
