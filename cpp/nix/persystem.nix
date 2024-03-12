{ pkgs, ... }:
{
  devShells.default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      cmake
      python311
      doxygen
      ninja
      clang-tools
      act
      just
      addlicense
    ];
  };
}
