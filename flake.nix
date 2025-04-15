{
  description = "daspoet";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";
    nixgl.url = "github:nix-community/nixGL";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    catppuccin.url = "github:catppuccin/nix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    ghostty.url = "github:ghostty-org/ghostty";

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixgl,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      meta = {
        dir = "/home/daspoet/nixos";
        user = {
          name = "daspoet";
          fullName = "Das Poet";
        };
        domain = "daspoet.dev";
        git = {
          username = "daspoet";
        };
        time = {
          zone = "Europe/Berlin";
        };
        cuda = false;
      };

      nixosSystem =
        module: overrideMeta:
        let
          updatedMeta = meta // overrideMeta;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;

            config = {
              allowUnfree = true;
              cudaSupport = updatedMeta.cuda;
            };

            overlays = [ nixgl.overlay ];
          };
          specialArgs = {
            inherit inputs pkgs-unstable;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = specialArgs // {
            meta = updatedMeta;
          };
          modules = [ module ];
        };
    in
    {
      nixosConfigurations = {
        desktop = nixosSystem ./hosts/desktops/vega {
          cuda = true;
          hypr = {
            monitors = [
              "DP-2, 1920x1080@239.96, 0x0, 1"
              "HDMI-A-1, 1920x1080@74.973, 1920x0, 1"
            ];
          };
        };

        vps = nixosSystem ./hosts/servers/vps { };
        wsl = nixosSystem ./hosts/wsl {
          git = {
            username = "Erkens, Cedric";
            userEmail = "cedric.erkens@soptim.de";
            credential = {
              "https://git-ac.soptim.net" = {
                provider = "generic";
              };
            };
          };
        };
      };
    };
}
