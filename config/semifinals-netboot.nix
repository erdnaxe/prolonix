# Generates a netboot image for semifinals

import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      # Import common configuration
      ./includes/common.nix

      # Build a netboot image
      <nixpkgs/nixos/modules/installer/netboot/netboot.nix>
    ];

    #  Use DHCP server to provide hostname
    networking.hostName = "";

    # SSH for remote debug
    services.openssh.enable = true;
    users.users.root.openssh.authorizedKeys.keys = [];
  };
}
