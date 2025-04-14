{ config, ... }:
{
  networking = {
    nameservers = [
      "10.18.100.101" # SOPTIM 1
      "10.18.100.100" # SOPTIM 2
      "8.8.8.8"       # Google DNS
      "8.8.4.4"       # Google DNS backup
      "1.1.1.1"       # Cloudflare
    ];
    search = [
      "soptim.net"
    ];
    # If your company uses specific internal DNS servers, add them here instead
  };
}
