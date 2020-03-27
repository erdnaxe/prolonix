{ config, pkgs, ... }:

{
  imports = [
    # Support any hardware (NixOS CD configuration)
    <nixpkgs/nixos/modules/profiles/all-hardware.nix>

    # Graphical Xserver with SDDM, Plasma5, PulseAudio, GLXinfo and Firefox
    <nixpkgs/nixos/modules/profiles/graphical.nix>

    # Hardened kernel and userspace
    #<nixpkgs/nixos/modules/profiles/hardened.nix>
  ];

  # Selected packages
  environment.systemPackages = [
    # Some text editors.
    pkgs.vim
    pkgs.emacs

    # Some compression/archiver tools.
    pkgs.unzip
    pkgs.zip

    # Commandline tools
    pkgs.screen
    pkgs.tmux
    pkgs.git
  ];

  # Set NixOS version
  system.stateVersion = "20.03";

  # Add XFCE4, Gnome3 and i3 and set Gnome3 as default
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.defaultSession = "gnome-xorg";

  # Show Plymouth bootscreen
  boot.plymouth.enable = true;
  boot.plymouth.logo = pkgs.fetchurl {
    url = "https://prologin.org/static/img/logo_cube.png";
    sha256 = "667efb8b47cd016e9f8b6ebb2cb63bc84cdea3c66eda771d953bc9debac3bf98";
  };

  # Fix Plasma5 and Seahorse collision
  programs.ssh.askPassword = "${pkgs.gnome3.seahorse}/libexec/seahorse/ssh-askpass";
}
