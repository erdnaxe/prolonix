import <nixpkgs/nixos> {
  system = "x86_64-linux";
  configuration = {
    imports = [
      # Import common configuration
      ./includes/common.nix

      # Build a netboot image
      <nixpkgs/nixos/modules/installer/netboot/netboot.nix>
    ];
  };
}
