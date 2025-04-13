{ config, ... }:

{
  services.restic.backups = {
    local = {
      initialize = true;
      repository = "/var/backup/restic/local";
      paths = []; # TODO
      passwordFile = config.sops.secrets."restic/secret".path;
    };
  };
}
