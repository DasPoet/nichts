{ meta, config, ... }:

{
  sops.templates.".m2/settings" = {
    path = "/home/${meta.user.name}/.m2/settings.xml";
    owner = meta.user.name;
    content = ''
      <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

          <!-- Default ist: c:/Benutzer/{user}/.m2/repository -->
          <!-- <localRepository>/path/to/local/repo</localRepository> -->

          <servers>
              <server>
                  <id>p2-soptim-elona-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-aundb-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-aundb-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-aundb-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-elona-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-elona-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-elona-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-fork-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-fork-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-itle-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-itle-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-itle-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-pia-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-pia-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-pia-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-amprion-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-amprion-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-amprion-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-fork-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-fork-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-pia-3rdparty</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-pia-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-pia-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-public-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-public-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-rdpro-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-rdpro-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-releases</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-s-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-snapshots</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
              <server>
                  <id>soptim-za-test</id>
                  <username>erke</username>
                  <password>${config.sops.placeholder."soptim_artifactory/token"}</password>
              </server>
          </servers>
      </settings>
    ''; 
  };

  sops.templates.".docker/config.json" = {
    path = "/home/${meta.user.name}/.docker/config.json";
    owner = meta.user.name;
    content = ''
      {
          "auths": {
              "https://docker-debian.artifactory.soptim.net:443" : {
                  "auth": "${config.sops.placeholder."soptim_artifactory/token"}",
                  "email": "cedric.erkens@soptim.de"
              }
          }
      }
    ''; 
  };

  sops.templates.".config/uv/uv.toml" = {
    path = "/home/${meta.user.name}/.config/uv/uv.toml";
    owner = meta.user.name;
    content = ''
      [[index]]
      url = "https://erke:${config.sops.placeholder."soptim_artifactory/token"}@artifactory.soptim.net/artifactory/api/pypi/pypi-soptim/simple"

      [[index]]
      url = "https://erke:${config.sops.placeholder."soptim_artifactory/token"}@artifactory.soptim.net/artifactory/api/pypi/pypi-soptim/simple"
    ''; 
  };
}
