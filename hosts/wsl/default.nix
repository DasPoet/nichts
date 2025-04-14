{
  meta,
  lib,
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ../default.nix

    ./dns.nix

    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl.enable = true;
  wsl.defaultUser = meta.user.name;

  networking.domain = "nodes.${meta.domain}";

  home-manager.users.${meta.user.name} = lib.mkDefault (
    import ../../home/headless { inherit inputs pkgs pkgs-unstable; }
  );

  security.sudo = {
    enable = true;
    extraConfig = ''
      %wheel ALL=(ALL) NOPASSWD: ALL
    '';
  };
}
