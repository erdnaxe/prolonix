{ config, pkgs, ... }:

{
  imports = [
    # Support any hardware (NixOS CD configuration)
    <nixpkgs/nixos/modules/profiles/all-hardware.nix>

    # Graphical Xserver with SDDM, Plasma5, PulseAudio, GLXinfo and Firefox
    <nixpkgs/nixos/modules/profiles/graphical.nix>

    # Hardened kernel and userspace
    #<nixpkgs/nixos/modules/profiles/hardened.nix>

    # Selected packages
    ./packages.nix
  ];

  # Set NixOS version
  system.stateVersion = "20.03";

  # Remove NixOS documentation
  documentation.nixos.enable = false;

  # Add XFCE4, Gnome3, LXQt and i3 and set Gnome3 as default
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.defaultSession = "gnome-xorg";

  # Disable some Gnome defaults
  services.dleyna-renderer.enable = false;
  services.dleyna-server.enable = false;
  services.gnome3.tracker-miners.enable = false;
  services.gnome3.tracker.enable = false;
  services.packagekit.enable = false;
  services.gnome3.gnome-remote-desktop.enable = false;
  services.gnome3.gnome-user-share.enable = false;
  services.gnome3.rygel.enable = false;
  services.avahi.enable = false;
  services.geoclue2.enable = false;
  environment.gnome3.excludePackages = [
    pkgs.gnome3.simple-scan
    pkgs.gnome3.epiphany
  ];

  # Show Plymouth bootscreen
  boot.plymouth.enable = true;
  boot.plymouth.themePackages = [
    (pkgs.breeze-plymouth.override {
      logoFile = pkgs.fetchurl {
        url = "https://prologin.org/static/img/logo_cube.png";
        sha256 = "667efb8b47cd016e9f8b6ebb2cb63bc84cdea3c66eda771d953bc9debac3bf98";
      };
      logoName = "logo_cube";
      osName = "Prologin";
      osVersion = "2020";
    })
  ];

  # Fix Plasma5 and Seahorse collision
  programs.ssh.askPassword = "${pkgs.gnome3.seahorse}/libexec/seahorse/ssh-askpass";

  # Disable hardware RNG entropy gatherer (fix virtual machines)
  security.rngd.enable = false;

  # Disable Bluetooth
  hardware.bluetooth.enable = false;

  # Disable printing
  services.printing.enable = false;
}
