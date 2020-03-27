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

  # Remove NixOS documentation
  documentation.nixos.enable = false;

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

  # SSH for remote debug
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDSdhwnHXW4jJHhoz1lQfbA094VmH6bFZ0sia6R+NChmhWRn/iZ5Lm5ePwjLTP1NTJZAix0nmMa2jwkT65y2jxVRCfhPcSabRRgh9lg1nUQjNnmE8ggF6gQ4kfzR2cmnofmWRwmRWLShRdk8TKhD16C5ejOFenV8AQj4KeZ3mjALBJqGg3IT23DvL6LBhN/c+qbc5sLMwJEDH+n7b+Wm2PkpxwDsMbBoRDCKGmqhY/nBpgA48FOTRuclqhLEy0Etp9kjy4aYIvgFVTXWD1WTzHvO1551S/rrd7syg5XuGgOCoRJxnkL+i3kepC8r0gnQo0A6vAPR4tWIZq3dKS7PQD3dhU6v2pgevsKtAtITGWzZG13w7HUdHRvssYdKSzO6UE+F4zKAfX9G0QBWRMkYcl/inz7jHOWlKLaUsdeNzVMMb5/MYie/lkDwpukHYFgoAQ6oLviZ2ZUh98SphuXIAdrZ2t6yxqAXRO6dUPa2qHG29OXfy5+qxo3/SlaCExRnxluRXHDMaxmtC9MowHf/fr4PJ7nscKLxM+o4PWhM9MhWpfuytbUwZuGqe/ifYW7lIRy7SH2EUbE1SOThHxsOKtitkRf11Q2olv92EWtDHq94uQPNAFADUwuIdQY9PDrV/SiMc8w4hKj689qXoG1YB06k2JSuD2myacUA4B/nNzC0Q== erdnaxe@xion"
  ];
}
