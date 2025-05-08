{
  description = "My config with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, hyprpanel, nixpkgs-unstable, nvchad4nix, ... }:
    let
      system = "x86_64-linux";

      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          overlay-unstable
        ];
      };

      lib = nixpkgs.lib;

      commonModules = [
        {nixpkgs.overlays = [
            overlay-unstable
            hyprpanel.overlay
          ];
        }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jvs = {
            imports = [
              nvchad4nix.homeManagerModule
              hyprpanel.homeManagerModules.hyprpanel
              ./home.nix
            ];
          };
        }
      ];
    in {
	    nixosConfigurations = {
		    jvs-pc = lib.nixosSystem rec {
			    inherit system;

          specialArgs = {
            hostName = "nixos-pc";
          };

			    modules = commonModules ++ [
				    ./configurations/configuration-pc.nix
            { home-manager.extraSpecialArgs = specialArgs; home-manager.backupFileExtension = "backup"; }
			    ];
		    };
        jvs-notebook = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            hostName = "nixos-notebook";
          };

			    modules = commonModules ++ [
            ./configurations/configuration-notebook.nix
            { home-manager.extraSpecialArgs = specialArgs; home-manager.backupFileExtension = "backup"; }
			    ];
        };
		};
	};
}
