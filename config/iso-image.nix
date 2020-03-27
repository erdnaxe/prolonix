{ config, pkgs, ... }:

{
  imports = [
    # Import common configuration
    ./includes/common.nix

    # Build an GPT/MBR hybrid ISO image with GRUB2 and isolinux
    <nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix>
  ];

  # Make bootable EFI/MBR ISO with memtest86+
  isoImage.volumeID = "PROLOGIN";
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  boot.loader.grub.memtest86.enable = true;
}
