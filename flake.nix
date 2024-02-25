{
  description = "My project templates for various languages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    lint-nix.url = "github:xc-jp/lint.nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    lint-nix,
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib.extend (_: _: import ./lib {inherit inputs outputs;});
    systems = ["x86_64-linux" "aarch64-linux"];
  in
    flake-utils.lib.eachSystem systems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      lints = lib.lints pkgs ./.;
    in {
      formatter = pkgs.alejandara;
      legacyPackages = {} // lints;
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [just fd act];
      };
    })
    // {
      templates = {
        cpp = {
          path = ./cpp;
          description = "C++ project template";
        };

        ruby = {
          path = ./ruby;
          description = "Ruby project template";
        };

        rust = {
          path = ./rust;
          description = "Rust project template";
        };
      };
    };
}
