{ meta, config, ... }:

{
  sops.templates.".netrc" = {
    path = "/home/${meta.user.name}/.netrc";
    owner = meta.user.name;
    content = ''
      machine git-ac.soptim.net
      login erke
      password ${config.sops.placeholder."soptim_gitlab/token"}
    ''; 
  };
}
