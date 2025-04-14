{ config, ... }:
{
  networking = {
    nameservers = [
      "8.8.8.8"      # Google DNS
      "8.8.4.4"      # Google DNS backup
      "1.1.1.1"      # Cloudflare
    ];
    # If your company uses specific internal DNS servers, add them here instead
  };
}
