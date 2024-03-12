{ pkgs, ... }:
{
  devShells.default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      just
      fd
      act
    ];
  };
}
