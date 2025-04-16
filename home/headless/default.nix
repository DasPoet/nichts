{ pkgs, pkgs-unstable, ... }:

{
  imports = [ ../default.nix ];

  programs.go = {
    enable = true;
    package = pkgs-unstable.go_1_24;
  };

  home.packages = [
    pkgs.openssl

    # Python
    pkgs.python3
    pkgs.uv
    pkgs.python312Packages.grip
    pkgs.python312Packages.pylatexenc
    pkgs.python312Packages.debugpy

    # AWS
    pkgs.awscli
    pkgs.ssm-session-manager-plugin

    # Terraform
    pkgs.terraform

    # Protobuf
    pkgs.buf
  ];
}
