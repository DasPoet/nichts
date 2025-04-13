{ pkgs-unstable, ... }:

{
  imports = [ ../default.nix ];

  programs.go = {
    enable = true;
    package = pkgs-unstable.go_1_24;
  };
}
