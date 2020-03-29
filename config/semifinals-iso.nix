# Generates a ISO image for semifinals
# This ISO can be burnt to a DVD or USB key

import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      # Import common configuration
      ./includes/common.nix

      # Build an GPT/MBR hybrid ISO image with GRUB2 and isolinux
      <nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix>
    ];

    # Make bootable EFI/MBR ISO with memtest86+
    isoImage.isoBaseName = "prolonix";
    isoImage.volumeID = "PROLOGIN";
    isoImage.appendToMenuLabel = " Prologin";
    isoImage.makeEfiBootable = true;
    isoImage.makeUsbBootable = true;
    boot.loader.grub.memtest86.enable = true;

    # Set hostname
    networking.hostName = "prologin";

    # Disable network
    networking.networkmanager.enable = false;

    # Create live user
    users.users.live = {
      isNormalUser = true;
      extraGroups = [ "video" ];
      createHome = false;
      description = "Live User";
      # Allow the graphical user to login without password
      initialHashedPassword = "";
    };

    # Autologin on virtual consoles
    services.mingetty.autologinUser = "live";

    # Provide user skeleton
    security.pam.services.login.makeHomeDir = true;
    security.pam.services.sddm.makeHomeDir = true;
    security.pam.makeHomeDir.skelDirectory = "${./user-skeleton}";
  };
}
