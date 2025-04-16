{ meta, config, ... }:

{
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
