# My NixOS Configuration

This is my NixOS configuration, set up to run with the Hyprland window manager. My motivation for creating this setup was to automate the system configuration process when I format my computer. With NixOS, I can declaratively configure the packages I need and set them up according to my requirements.


## How I use this setup

1. **After installing NixOS**, I clone this repo with:
   ```bash
   git clone https://github.com/joaovs2004/nixos-conf.git ~/flake
   cd ~/flake
   ```
2. The first time I rebuild the system, I need to run:
   ```bash
   # To build for my pc
   sudo nixos-rebuild switch --flake .#jvs-pc

   # To build for my laptop
   sudo nixos-rebuild switch --flake .#jvs-notebook
   ```
3. After the first rebuild, The alias rebuild is avaible.
    ```bash
    # runs sudo nixos-rebuild switch --flake .#jvs-pc
    rebuild-pc

    # runs sudo nixos-rebuild switch --flake .#jvs-notebook
    rebuild-notebook
   ```
4. I develop using nix-shell, to activate nix-shell I use the alias dev
    ```bash
    # runs nix-shell ~/flake/dev-shell.nix
   dev
   ```
## Screenshots
![Alt text](https://i.imgur.com/sPHq1JJ.png "Screenshot 1")
![Alt text](https://i.imgur.com/QMlaSfo.png "Screenshot 2")
