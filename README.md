# My NixOS Configuration

This is my NixOS configuration, set up to run with the Hyprland window manager. My motivation for creating this setup was to automate the system configuration process when I format my computer. With NixOS, I can declaratively configure the packages I need and set them up according to my requirements.


## How I use this setup

1. **After installing NixOS**, I clone this repo with:
   ```bash
   git clone https://github.com/joaovs2004/nixos-conf.git ~/flake
   cd ~/flake
2. The first time I rebuild the system, I need to run:
   ```bash
   sudo nixos-rebuild  switch --flake .#jvs
3. After the first rebuild, The alias rebuild is avaible.
    ```bash
    # runs sudo nixos-rebuild  switch --flake .#jvs
   rebuild
4. I develop inside a container created with distrobox. After creating the container, just type the alias dev to access it.
    ```bash
    # runs distrobox enter ubuntu
   dev
## Screenshots
![Alt text](https://i.imgur.com/sPHq1JJ.png "Screenshot 1")
![Alt text](https://i.imgur.com/QMlaSfo.png "Screenshot 2")