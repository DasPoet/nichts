{ meta, config, ... }:

{
  sops.templates.".config/titan/zrs.json" = {
    path = "/home/${meta.user.name}/.config/titan/zrs.json";
    owner = meta.user.name;
    content = ''
      {
        "devApiKey": "${config.sops.placeholder."zrs/dev_api_key"}" 
      }
    ''; 
  };
}
