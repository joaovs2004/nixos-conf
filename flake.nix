{
  description = "My config with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, hyprpanel, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in {
	    nixosConfigurations = {
		    jvs = lib.nixosSystem {
			    inherit system; 

			    modules = [
			    	    {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
				    ./configuration.nix
				    home-manager.nixosModules.home-manager {
					    home-manager.useGlobalPkgs = true;
					    home-manager.useUserPackages = true;
					    home-manager.users.jvs = {
						    imports = [
							    ./home.nix
						    ]; 
					    };
				    }
			    ];
		    };
		};
	};
}
