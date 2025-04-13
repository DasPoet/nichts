{ config, meta, ... }:

{
  services.restic.backups = {
    local = {
      initialize = true;
      repository = "/var/backup/restic/local";
      paths = [
        "${meta.user.name}/github/postkuh"
      ];
      passwordFile = config.sops.secrets."restic/secret".path;
    };
  };
}
