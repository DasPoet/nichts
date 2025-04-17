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

    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;

    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    wslConf.network.generateResolvConf = false;

    defaultUser = meta.user.name;
  };

  networking.domain = "nodes.${meta.domain}";

  home-manager.users.${meta.user.name} = lib.mkDefault (
    import ../../home/erke-headless { inherit inputs pkgs pkgs-unstable; }
  );

  security.sudo = {
    enable = true;
    extraConfig = ''
      %wheel ALL=(ALL) NOPASSWD: ALL
    '';
  };
}
