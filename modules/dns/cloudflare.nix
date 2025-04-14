{ lib, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    nameservers = lib.mkDefault [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
